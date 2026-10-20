declare module '@apiverve/passwordbreach' {
  export interface passwordbreachOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface passwordbreachResponse {
    status: string;
    error: string | null;
    data: PasswordBreachCheckerData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface PasswordBreachCheckerData {
      breached:    boolean | null;
      breachCount: number | null;
      riskLevel:   null | string;
      inputType:   null | string;
      hashPrefix:  null | string;
  }

  export default class passwordbreachWrapper {
    constructor(options: passwordbreachOptions);

    execute(callback: (error: any, data: passwordbreachResponse | null) => void): Promise<passwordbreachResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: passwordbreachResponse | null) => void): Promise<passwordbreachResponse>;
    execute(query?: Record<string, any>): Promise<passwordbreachResponse>;
  }
}
