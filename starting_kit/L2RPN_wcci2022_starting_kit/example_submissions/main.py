import grid2op
from submission_withbaselines.my_baseline import make_agent

if __name__ == "__main__":
  env = grid2op.make("l2rpn_wcci_2022_dev")
  agent = make_agent(env, "/Users/gaetanserre/Documents/Projects/L2RPN_Codalab_Competition_Bundle/competition_codalab/L2RPN_wcci2022/L2RPN_wcci2022_starting_kit/example_submissions/submission_withbaselines")
  print(agent.act(env.reset(), 0, False))