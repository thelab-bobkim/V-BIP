
"""

Phase 3-A에서 Phase 3-B를 호출하는 함수

"""

import subprocess

import json

from pathlib import Path

from loguru import logger





def trigger_ai_diagnosis(failure_id: int) -> dict:

    """

    Phase 3-B AI 진단 엔진 호출

    

    Args:

        failure_id: backup_failures 테이블의 ID

        

    Returns:

        dict: 진단 결과 {'success': bool, 'diagnosis': str/dict, 'error': str}

    """

    try:

        diagnosis_path = Path(__file__).parent.parent / 'ai_diagnosis'

        diagnosis_script = diagnosis_path / 'diagnosis_engine.py'

        venv_python = diagnosis_path / 'venv' / 'bin' / 'python'

        

        if not diagnosis_script.exists():

            logger.error(f"AI 진단 스크립트를 찾을 수 없습니다: {diagnosis_script}")

            return {'success': False, 'error': 'Script not found'}

            

        if not venv_python.exists():

            logger.error(f"Python 실행 파일을 찾을 수 없습니다: {venv_python}")

            return {'success': False, 'error': 'Python not found'}

        

        logger.info(f"AI 진단 시작 (Failure ID: {failure_id})")

        

        # Phase 3-B 실행

        result = subprocess.run(

            [str(venv_python), str(diagnosis_script), '--failure-id', str(failure_id)],

            cwd=str(diagnosis_path),

            capture_output=True,

            text=True,

            timeout=120

        )

        

        if result.returncode == 0:

            logger.success(f"AI 진단 완료 (Failure ID: {failure_id})")

            

            # 진단 결과 파싱

            try:

                last_line = result.stdout.strip().split('\n')[-1]

                diagnosis_result = json.loads(last_line)

                return {'success': True, 'diagnosis': diagnosis_result}

            except json.JSONDecodeError:

                return {'success': True, 'diagnosis': result.stdout}

        else:

            logger.error(f"AI 진단 실패: {result.stderr}")

            return {'success': False, 'error': result.stderr}

            

    except subprocess.TimeoutExpired:

        logger.error("AI 진단 타임아웃 (120초)")

        return {'success': False, 'error': 'Timeout after 120 seconds'}

    except Exception as e:

        logger.error(f"AI 진단 오류: {e}")

        return {'success': False, 'error': str(e)}

