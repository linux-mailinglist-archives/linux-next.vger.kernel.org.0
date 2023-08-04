Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB7F770940
	for <lists+linux-next@lfdr.de>; Fri,  4 Aug 2023 22:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjHDUAu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Aug 2023 16:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjHDUAt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Aug 2023 16:00:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C34E6E
        for <linux-next@vger.kernel.org>; Fri,  4 Aug 2023 13:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691179247; x=1722715247;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=2rgd6tM0RkPc3NFfGFM3vC1s8ZbtOEFfFPkgM0on7Q4=;
  b=MtJsA8prA8eWihyxD8EQvS69VvZ/qxz2svUlfvdl1nWVvCeqdZxYPTfG
   ckXH2+h3Z/QDHmyOqMumpmXhARE6xuj+lWS75j4AS5OCwxrAqfUDEeRlW
   afbZW4gIsi+X2rguTmLujllCLgpoJqs0L8VGAmhyQht2CHTwHoq6VO9di
   JWoko4G9gUDCDaRJ8DlbbKld4JGNofnR5Gv8Tc4lCtj7LSMwCNII5Ll1w
   2/mmKsrA1a9Nt8ea+sI+siiBNcRimCPwyYYyD2LdGsJGq+roTLTNsacgh
   PeoaZkUAz5JrlaUpCVjgmj5F2OuQ345NDntrAW8l933GIevwFLrTeAu13
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401194237"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="401194237"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 13:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="680059072"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="680059072"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 13:00:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:00:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:00:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:00:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:00:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw9gCDD+3Jwe91KjdY1UfC9dQ40Vs304R4/Yvt8gHLb3QDFDtJS9XgJLXuvCl0IN9rVZTL8syW7akIBuZxP1+N0tJMvMyJc5+xMPDX8aWuWO/gPt8LZy8MwmJG+sdtuSGgIs7+nfgloNX1MJrh1hq+edtBSpgR3XwKs48JQ+ZkZZV96NWHnr3qEUfOWX7p41wJAH97JdWyaoij+EOkg0kdGrLOcpWhOB0HcC/TC3ZB7QLQCLyvbWZeIbGY81bukiGYTb371GGpGYFVrPWjs/enxGfcCdbAMdVyuw0DqzxqBxvlZPzS/iFWjvK7emPsmH8ysG9/UMgPCiqMhKeSiXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rgd6tM0RkPc3NFfGFM3vC1s8ZbtOEFfFPkgM0on7Q4=;
 b=N7eYCoc6gBrLZqkUKtHQeZyqSdilb94wt2UsAPc4GxVWbbAJ4oQcuKVXR9uTCuxW/jHa7udSouGAgmgl1j4mYhW9HXc357Nmvn3iJyue248fXfIXs06HUuGvlMHIAMpw9o7WHINY/gBVMxpqTYZkxVow4PPgLbMWP5GAUs0yrl3aJiS1VYnao7N0e3JE4dFhMwy8O7i876U2lcj3hi3MHrMJnzqi+M37m81Of/JN+P/mvJJj4lUEwTTr/3wGfSuyuoaQTtCaud3bDWhFuy1Mjos2qjYFf7di73eod6/tHKmCVAY+B+emKZ5mRpiTbJVx4+qKLgC+S3QQNx/jS8aEVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 20:00:43 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::abd2:f781:1433:259]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::abd2:f781:1433:259%3]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 20:00:43 +0000
From:   "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC:     "broonie@kernel.org" <broonie@kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Hansen, Dave" <dave.hansen@intel.com>
Subject: Shadow stack branch for linux-next
Thread-Topic: Shadow stack branch for linux-next
Thread-Index: AQHZxw5Zbi28um0rZEivOJoMThGUMw==
Date:   Fri, 4 Aug 2023 20:00:43 +0000
Message-ID: <5339bb88079f75a1e725ece7fc562938ba193169.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SJ2PR11MB7716:EE_
x-ms-office365-filtering-correlation-id: 672d6435-5cb8-4584-82d6-08db95257c71
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YALaZi/YkIw5tuEf1iFqnAT9UnSN+noRLjM3cIw2AK5z1Er1jJN46ND+xhswCH3bJZf0FE2LaeG4I2n30NtfD9KPDXwgqj8Whv8BRBmA44z3Yhmlj5fnYkj3SeOx+lhAw240ZycB+XR3ItirJ5AOYRiWSfF2GY7eIk6D5JZnfECQd6bV0EDUNc7LILM1uXYx/dJ+bnj6IKuH4oh9NCKFCKDA5KESuPtTSLaJSUWAPq50PREcy53XXGO/xyluQ9UjIDFRB8Q0hb64vaYt7x8hTPWnuY/ElQkC0c3SgU7eI/nttt4nvHGtDmkMmsc4aZimxOdyPSldJnedO4EdQ8Zq2DTnSPg048YKQ/x+YFKWgDQQFIPt5hCunQju7d9eqQl+VuceEyug3LTHLEiwkdLAdUwl8gQ9vcR1LFgti0knUSpej4pNLTOBlvTeq9KCYGvyEPVJ3fE59QlErWS35+o5DCzPijA40f6AgiJE7m3INI5vbH22wJXWJ7x+u8WDw3BVOI5RM+xMA/jughkuM+HQjkVRha99+LJ5cCRlpelS6etEZCZlktlGaM9+voffpHKLPhU00YT74JjFq/jaz+pghWezItpxL75Sz5WnLRGNYG8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(1800799003)(186006)(83380400001)(2616005)(107886003)(26005)(6506007)(8676002)(66476007)(2906002)(4326008)(91956017)(316002)(76116006)(6916009)(66946007)(5660300002)(66446008)(64756008)(66556008)(4744005)(8936002)(41300700001)(966005)(71200400001)(6486002)(6512007)(478600001)(54906003)(38100700002)(82960400001)(122000001)(36756003)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXZtcStoKzdBWG12UDhiUmlOeVhVbFlGVy9sOWZsaG1LWFZ0RWVMRTFpNmVh?=
 =?utf-8?B?aGdwLzhJemRWMklJaGRiZTNRUHhGL3dlcUtZellGS1BDUmh3SVlVZ082Zk8w?=
 =?utf-8?B?eXVUMEEwcTFDdk1KaERuYjlkV0pHVkQ4Sm94M1lvTnRad0VnMzZaVkJJR3ZY?=
 =?utf-8?B?RVRSekZnOGtzdFlocW1KZkxsY25JZTI2b3QxUWxBaUNlV0o5c0xIWGEwQjQr?=
 =?utf-8?B?NTZaREVLbjV4MWlyN2R5RUVEbHpURHB2YjhDOE01T2RZczhRNENSQVAzR0RO?=
 =?utf-8?B?YWd0OFExeHUxYy9xdTFNMFMvTEZyT1hZL09OUjJTNDVoTjJoUjdrcmVvS25J?=
 =?utf-8?B?S0RIWU1HZU5KeGJ2QndqMVVNU0dzZnlJYjQ4Rmc1aHhvRngxcXgzWFJ5L1dx?=
 =?utf-8?B?eFBnYXJzU3pwWHU3ajhhTnN5MnJ2N3kyN0p5b1lSdFBRbmFkL1V5eDVLQ0dR?=
 =?utf-8?B?aFl0QmlNK0cwa0hMZ2tQNjg3M1IvT1lsdXl2MUZueU8zUkhBcnlhYVd6UUMw?=
 =?utf-8?B?TXUrMGJzbzRSRmdVazk3TEFzenE5amIzcTE1Yzd1UGdURzdkUGZ6ekFHbGpx?=
 =?utf-8?B?d1FRZjBnU3BOU25MVndTMzUyKzdDaUZqVEF1UWY2UWdKYkdvb2gzNjVXTlJG?=
 =?utf-8?B?Sk1uaWUrdDBjeDdzY29PemFaSU5HblZvL0ZyZ0dOaUpaQUpianl3Sy9US2Fk?=
 =?utf-8?B?NFVycm1qOUxTRElBZXlPbTBCMXljYVJWUFkrS2NUc1pIblJBaHNtanhtZ3Ri?=
 =?utf-8?B?b3Y1eGt3L296dWJyd2RCZnE0YWgxQU1aUkxRUnV0eHdvN2JLaHBHdTFzSUFZ?=
 =?utf-8?B?TmNJbFh6YXN0dklLZG1DN0RSai94cXYzalFRcXRqdEJrRWNwenlxUzVYNnU2?=
 =?utf-8?B?UHJZZzZVQUFPbFVjTGc3VTdZcGFrY1ZwWWI3UkhxcXVwZG1GdmJZV1BmRzhr?=
 =?utf-8?B?aUFteUd1WGtBL1lMaUJ4VGh5Q1ArRTBnWnNoeHoxSEdENDM1REpmNHJ1bUZY?=
 =?utf-8?B?WXIzUi94SzdIUmVMTHREenRtSjVVNExYVzY0TVdhUWhDK21RRGNtQno5RnFP?=
 =?utf-8?B?d1J4c2Q5S1I5RE9hZlN1QW4xbDhlS0ZwNW4wOEdVeGw3blFoTEhyVktrMFBl?=
 =?utf-8?B?dVFxOGp0RWpPN0NKUktveDFCQXlLajNtWFcrZnhEclZoSkhUMkN0aDZGZmdE?=
 =?utf-8?B?NElhWFprdGJqdzViNjFtUGZvVm0yVld4VmRVV2MyNXVpbmZwWUQxMWk1cm1G?=
 =?utf-8?B?TVFuckF4M05xaTJ2eDZqNFZvVjJpYmxQOHp1MlJ5SHNBb2k4a2JUMENKY1cz?=
 =?utf-8?B?clJWeXU3OXJkb2Y2aG1yK20vNFBZT3RMK0wzMVBBZlIyQkZ3M09pM3BJYmZE?=
 =?utf-8?B?VEZKSERiSHlETjhSYjJWM2NOZFNKV01qTUlDcDQ4Z3UxOVQ1eENPcUE5MEto?=
 =?utf-8?B?RUNGcmxLQmNZeVZZQnFNOEhpWkszbFJ4N2loemwrczdyY1hXZ0VkWHZxdk9C?=
 =?utf-8?B?dDEzckRwRzlvNTdoMkorKytpcVJNTE92Nmpna1BURVkyemE3eGU4WDBjdjVB?=
 =?utf-8?B?TnVoM01mUC9Cb01Ba0ZmK21PbG1pY1AzSXQ3TDFIa3dpSWhrWE9aMldJTU1K?=
 =?utf-8?B?UmZQR3VuMEJGKzNJZmFCcHRrRitKdUFkZkl0N0VYNmxRSi9uMmNLS1dvdk1r?=
 =?utf-8?B?TjM2ZXNjdFErMCtvdk5lRitHeWJORDVzamtvMmVFakkwQ0ZZa0huenJvVTg4?=
 =?utf-8?B?VGZRVG44Vm44RVg0anJ3YTBwK0E1YWlLYWF6ZWFoSGEzOEhEN1BSVlFIaEVl?=
 =?utf-8?B?aXlCYi9iRThUU0JJLzZEZUVudTZqQksyM1VhbGd6VEVNcjJlcUVJTmlOamYv?=
 =?utf-8?B?aDBESnRQbllDZzhibGorQ25XdE5lZnBiSEVrR1F0d1VkdDVmZ0drdEpGV3p4?=
 =?utf-8?B?WG1GSVJIVEhlcXpnc1o5SkdYUXFucHpXYkpVcmRXOUFKVk93cWpYZDFsU3JR?=
 =?utf-8?B?VW1JTnhNUUtQZnZNUEN6U29SQXM4dWtwYm1kRkI3ckc3bjQyY2IxZiszNSth?=
 =?utf-8?B?dVZLbmtIcjFWVEhmaHR3L1FHR1l0V255RitnMDY5TWM0bDRFTHQwRDYyclI2?=
 =?utf-8?B?YlNBdkRnc0FGbUJDOWFmT201UXN5TThHUlJpMThjd0tEaE5MQnFKaTMrUGxC?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FB749830060CE49A39A4655238EBAC5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672d6435-5cb8-4584-82d6-08db95257c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 20:00:43.6999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u78T6MMyuQln8SCsnzwatQEGc1+SOaxYXsurX2bBr3J0SJ7OsoWT60xqMbzEnIJqTIlTWZdhhZcAESkA+QpQvMoK4dyShBQC5RLijtittaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGksDQoNClRoZSBzaGFkb3cgc3RhY2sgYnJhbmNoIGluIHRpcCBoYXMgbm90IGJlZW4gaW5jbHVk
ZWQgaW4gbGludXgtbmV4dC4gQW4NCnVwZGF0ZWQgdmVyc2lvbiBpcyBoZXJlOg0KaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQvbG9nLz9o
PXg4Ni9zaHN0aw0KDQpBcG9sb2dpZXMgaWYgSSdtIG1pc3Npbmcgc29tZSBwYXJ0IG9mIHRoZSBw
cm9jZXNzLiBJcyB0aGVyZSBhbnl0aGluZw0KbmVlZGVkIHRvIG1ha2UgaXQgYWNjZXB0YWJsZSBm
b3IgaW5jbHVzaW9uPw0KDQpUaGUgc2VyaWVzIGhhc24ndCBjaGFuZ2VkIG11Y2ggc2luY2UgdGhl
IDYuNCBiYXNlZCBicmFuY2ggZXhjZXB0IGENCnJlYmFzZSBhbmQgYSBmZXcgc21hbGwgcGF0Y2hl
cyBvbiB0b3AuIEFGQUlLLCB0aGVyZSBpcyBub3RoaW5nIGdhdGluZw0Kc3VibWlzc2lvbiBmb3Ig
Ni42LCBzbyBpdCB3b3VsZCBiZSBuaWNlIHRvIGdldCBpdCBzb21lIGxpbnV4LW5leHQNCmV4cG9z
dXJlLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBjYW4gZG8gYW55dGhpbmcgdG8gZmFjaWxpdGF0
ZSB0aGlzLg0KDQpUaGFua3MsDQoNClJpY2sNCg==
