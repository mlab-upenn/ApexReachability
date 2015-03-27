(set-logic QF_NRA_ODE)
(declare-fun v_env () Real)
(declare-fun v_dot () Real)
(declare-fun v () Real)
(declare-fun tau () Real)
(declare-fun sy_dot () Real)
(declare-fun sy_d () Real)
(declare-fun sy () Real)
(declare-fun sx_env () Real)
(declare-fun sx_dot () Real)
(declare-fun sx_d () Real)
(declare-fun sx () Real)
(declare-fun delta_dot () Real)
(declare-fun delta () Real)
(declare-fun a_env () Real)
(declare-fun Psi_dot () Real)
(declare-fun Psi_ddot () Real)
(declare-fun Psi_d () Real)
(declare-fun Psi () Real)
(declare-fun Beta_dot () Real)
(declare-fun Beta () Real)
(declare-fun v_env_0_0 () Real)
(declare-fun v_env_0_t () Real)
(declare-fun v_dot_0_0 () Real)
(declare-fun v_dot_0_t () Real)
(declare-fun v_0_0 () Real)
(declare-fun v_0_t () Real)
(declare-fun tau_0_0 () Real)
(declare-fun tau_0_t () Real)
(declare-fun sy_dot_0_0 () Real)
(declare-fun sy_dot_0_t () Real)
(declare-fun sy_d_0_0 () Real)
(declare-fun sy_d_0_t () Real)
(declare-fun sy_0_0 () Real)
(declare-fun sy_0_t () Real)
(declare-fun sx_env_0_0 () Real)
(declare-fun sx_env_0_t () Real)
(declare-fun sx_dot_0_0 () Real)
(declare-fun sx_dot_0_t () Real)
(declare-fun sx_d_0_0 () Real)
(declare-fun sx_d_0_t () Real)
(declare-fun sx_0_0 () Real)
(declare-fun sx_0_t () Real)
(declare-fun delta_dot_0_0 () Real)
(declare-fun delta_dot_0_t () Real)
(declare-fun delta_0_0 () Real)
(declare-fun delta_0_t () Real)
(declare-fun a_env_0_0 () Real)
(declare-fun a_env_0_t () Real)
(declare-fun Psi_dot_0_0 () Real)
(declare-fun Psi_dot_0_t () Real)
(declare-fun Psi_ddot_0_0 () Real)
(declare-fun Psi_ddot_0_t () Real)
(declare-fun Psi_d_0_0 () Real)
(declare-fun Psi_d_0_t () Real)
(declare-fun Psi_0_0 () Real)
(declare-fun Psi_0_t () Real)
(declare-fun Beta_dot_0_0 () Real)
(declare-fun Beta_dot_0_t () Real)
(declare-fun Beta_0_0 () Real)
(declare-fun Beta_0_t () Real)
(declare-fun time_0 () Real)
(declare-fun mode_0 () Real)
(define-ode flow_1 ((= d/dt[tau] 1) (= d/dt[Beta] (- (+ (* (- (/ (- (* 108000 1.515) (* 108000 1.292)) (* (* 2273 v) v)) 1) Psi_dot) (/ (* 108000 delta) (* 2273 v))) (* (* (/ (+ 108000 108000) 2273) v) Beta))) (= d/dt[Psi_dot] (+ (- (* (/ (- (* 108000 1.515) (* 108000 1.292)) 4423) Beta) (* (/ (- (* (* 108000 1.292) 1.292) (* (* 108000 1.515) 1.515)) 4423) (/ Psi_dot v))) (* (/ (* 108000 1.292) 4423) delta))) (= d/dt[Psi] Psi_dot) (= d/dt[v] (+ (* 1 (+ (* (cos Psi_d) (- sx_d sx)) (* (sin Psi_d) (- sy_d sy)))) (* 10 (- 7.5 v)))) (= d/dt[sx] (* v (cos (+ Beta Psi)))) (= d/dt[sy] (* v (sin (+ Beta Psi)))) (= d/dt[delta] (- (+ (+ (* 2 (- (* (cos Psi_d) (- sy_d sy)) (* (sin Psi_d) (- sx_d sx)))) (* 12 (- Psi_d Psi))) (* 4 (- (/ (* v (sin v)) (^ (- (^ v 2) (^ (cos v) 2)) 0.5)) Psi_dot))) (* 2 delta))) (= d/dt[sx_d] 7.5) (= d/dt[sy_d] 0) (= d/dt[Psi_d] 0) (= d/dt[Beta_dot] (- (+ (* (/ (- (* 108000 1.515) (* 108000 1.292)) 2273) (- (* v Psi_ddot) (* (* 2 Psi) v_dot))) (* (/ 108000 2273) (- (* v delta_dot) (* delta v_dot)))) (* (/ (+ 108000 108000) 2273) (+ (* v Beta_dot) (* Beta v_dot))))) (= d/dt[Psi_ddot] (+ (- (* (/ (- (* 108000 1.515) (* 108000 1.292)) 4423) Beta_dot) (* (/ (- (* (* 108000 1.292) 1.292) (* (* 108000 1.515) 1.515)) 4423) (- (* v Psi_ddot) (* Psi_dot v_dot)))) (* (/ (* 108000 1.292) 4423) delta_dot))) (= d/dt[v_dot] (+ (* 2 (- 0 sy_dot)) (* 10 (- 0 v_dot)))) (= d/dt[sx_dot] (+ (- (* v_dot (cos (+ Beta Psi))) (* v (+ Beta_dot Psi_dot))) (* v_dot (sin (+ Beta Psi))))) (= d/dt[sy_dot] (+ (* (* v (+ Beta_dot Psi_dot)) (cos (+ Beta Psi))) (* v_dot (sin (+ Beta Psi))))) (= d/dt[delta_dot] (- (- (- (* -2 sy_dot) (* 12 Psi_dot)) (* 4 Psi_ddot)) (* 2 delta_dot))) (= d/dt[sx_env] v_env) (= d/dt[v_env] a_env) (= d/dt[a_env] 0)))
(assert (<= 0 v_env_0_0))
(assert (<= v_env_0_0 10))
(assert (<= 0 v_env_0_t))
(assert (<= v_env_0_t 10))
(assert (<= -5 v_dot_0_0))
(assert (<= v_dot_0_0 10))
(assert (<= -5 v_dot_0_t))
(assert (<= v_dot_0_t 10))
(assert (<= 0 v_0_0))
(assert (<= v_0_0 10))
(assert (<= 0 v_0_t))
(assert (<= v_0_t 10))
(assert (<= 0 tau_0_0))
(assert (<= tau_0_0 4))
(assert (<= 0 tau_0_t))
(assert (<= tau_0_t 4))
(assert (<= -5 sy_dot_0_0))
(assert (<= sy_dot_0_0 5))
(assert (<= -5 sy_dot_0_t))
(assert (<= sy_dot_0_t 5))
(assert (<= 0 sy_d_0_0))
(assert (<= sy_d_0_0 20))
(assert (<= 0 sy_d_0_t))
(assert (<= sy_d_0_t 20))
(assert (<= 0 sy_0_0))
(assert (<= sy_0_0 20))
(assert (<= 0 sy_0_t))
(assert (<= sy_0_t 20))
(assert (<= 0 sx_env_0_0))
(assert (<= sx_env_0_0 20))
(assert (<= 0 sx_env_0_t))
(assert (<= sx_env_0_t 20))
(assert (<= -5 sx_dot_0_0))
(assert (<= sx_dot_0_0 5))
(assert (<= -5 sx_dot_0_t))
(assert (<= sx_dot_0_t 5))
(assert (<= 0 sx_d_0_0))
(assert (<= sx_d_0_0 20))
(assert (<= 0 sx_d_0_t))
(assert (<= sx_d_0_t 20))
(assert (<= 0 sx_0_0))
(assert (<= sx_0_0 20))
(assert (<= 0 sx_0_t))
(assert (<= sx_0_t 20))
(assert (<= -5 delta_dot_0_0))
(assert (<= delta_dot_0_0 5))
(assert (<= -5 delta_dot_0_t))
(assert (<= delta_dot_0_t 5))
(assert (<= -0.15 delta_0_0))
(assert (<= delta_0_0 0.15))
(assert (<= -0.15 delta_0_t))
(assert (<= delta_0_t 0.15))
(assert (<= -2 a_env_0_0))
(assert (<= a_env_0_0 2))
(assert (<= -2 a_env_0_t))
(assert (<= a_env_0_t 2))
(assert (<= -5 Psi_dot_0_0))
(assert (<= Psi_dot_0_0 5))
(assert (<= -5 Psi_dot_0_t))
(assert (<= Psi_dot_0_t 5))
(assert (<= -5 Psi_ddot_0_0))
(assert (<= Psi_ddot_0_0 5))
(assert (<= -5 Psi_ddot_0_t))
(assert (<= Psi_ddot_0_t 5))
(assert (<= -5 Psi_d_0_0))
(assert (<= Psi_d_0_0 5))
(assert (<= -5 Psi_d_0_t))
(assert (<= Psi_d_0_t 5))
(assert (<= -1 Psi_0_0))
(assert (<= Psi_0_0 1))
(assert (<= -1 Psi_0_t))
(assert (<= Psi_0_t 1))
(assert (<= -5 Beta_dot_0_0))
(assert (<= Beta_dot_0_0 5))
(assert (<= -5 Beta_dot_0_t))
(assert (<= Beta_dot_0_t 5))
(assert (<= -5 Beta_0_0))
(assert (<= Beta_0_0 5))
(assert (<= -5 Beta_0_t))
(assert (<= Beta_0_t 5))
(assert (<= 0 time_0 [0.000000]))
(assert (<= time_0 4 [0.000000]))
(assert (<= 1 mode_0))
(assert (<= mode_0 1))
(assert (and (and (>= a_env_0_0 -2) (= v_env_0_0 7.5) (= delta_dot_0_0 0) (= sy_dot_0_0 0) (= sx_dot_0_0 0) (= v_dot_0_0 0) (= Psi_ddot_0_0 0) (= Beta_dot_0_0 0) (= Psi_d_0_0 0) (= tau_0_0 0) (= delta_0_0 0) (= Beta_0_0 0) (= Psi_dot_0_0 0) (= Psi_0_0 0) (= sy_d_0_0 0) (= sx_d_0_0 0) (= v_0_0 7.5) (= sy_0_0 0) (= sx_0_0 0)) (= mode_0 1) (= [v_env_0_t v_dot_0_t v_0_t tau_0_t sy_dot_0_t sy_d_0_t sy_0_t sx_env_0_t sx_dot_0_t sx_d_0_t sx_0_t delta_dot_0_t delta_0_t a_env_0_t Psi_dot_0_t Psi_ddot_0_t Psi_d_0_t Psi_0_t Beta_dot_0_t Beta_0_t] (integral 0. time_0 [v_env_0_0 v_dot_0_0 v_0_0 tau_0_0 sy_dot_0_0 sy_d_0_0 sy_0_0 sx_env_0_0 sx_dot_0_0 sx_d_0_0 sx_0_0 delta_dot_0_0 delta_0_0 a_env_0_0 Psi_dot_0_0 Psi_ddot_0_0 Psi_d_0_0 Psi_0_0 Beta_dot_0_0 Beta_0_0] flow_1)) (= mode_0 1) (= mode_0 1) (> tau_0_t 1) (> sx_0_t 1)))
(check-sat)
(exit)
