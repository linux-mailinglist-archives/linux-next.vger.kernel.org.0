Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9387D26A257
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 11:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIOJfl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 05:35:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:20531 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOJfi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 05:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1600162538; x=1631698538;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=JPCcn63+6WEeT2WUCCz6K0LRYwG+ubmxcPEoiIRDgZE=;
  b=YVN6TsxPukaw/DyWdQQJtKU0MqzxzLs9RR/BOil+zsc1ZR7FqOikAy7Q
   mQ4sih2SN93okPEJ+/0zRO5X+YssqdAHIonEsOMC+vwLfWDjb+KRPKXVE
   38seB3UXrGjaaO4BYhP8S0UlqrYESV2m2jPeSqLwkZQvrGESeIfgKIxs0
   cCHanLU3+/hBbCXoiN/AX3l2bk4Ssd4wMFZb24HSX3MdtOXLrrlTy6Xm+
   tS2srL4M9Mtbg5uQN+npk0rBlrongrSgSdf8g5lDy2LtpJa9zOvqsW0Bb
   XaYvACsHaC0VioJmfN4HzP3PV9NunMqN+vkVEYBTSJENyESzUAWPYgqqW
   Q==;
IronPort-SDR: L8kfzIeVFhNG/wLgFLYtoTRHlakZMTaWuV4VQJEMkYmkNJzhtGFQw6o3DLOTGgiUhVNQNK7uV4
 bCrw5XiTGHKuwsSdAcM1fnWm0ZiI+F5clCptXS+jf5YlRdXSr+m6oqojNQoNczARhyI3oQMinL
 OUpLMT5qsweM9bhCzPGv4aLmXX6bu1ZA+NsxqeCo7rSPij5l26QwMHLTO8HZynbHRrln8jtmNZ
 GeFNWLOxb26KXO9Nz6Ypz2cxURPC7vn70LNlH39Pp5+YzeS6hpmO1bs1m/9sDCLjo4Mr9cH7Gb
 Nis=
X-IronPort-AV: E=Sophos;i="5.76,429,1592841600"; 
   d="scan'208";a="147329347"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
  by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 17:35:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOBSE+ipv+prmyxi/OKUqzHD7uTcK7BnjDPNDdtLCh7yawGD+/tB++XDa6IlLCtdx2Bw50KqZiKP93RdiIaGC71XOmBDcvZwR2/iC/FZN4p9KxY3GjUf5zzH40OlIrP5eBRnSHsrUGJDJcBAJhdLCmWC6pSBvtW6EFwJDOtDFy7rrK5u2pI9cEEp3MZrGANAX9vtd8xr9MPcuEcviXF9GJMfgzaKnCf44hmF3m1mwqwWx9YU6CU4rE9Vo2RbSnRaHbGBYoIEf4PVOIHuQ45Vn2hAeZpxUeeZdlijps8JUK7oxlD66eHjxyjxnx+97JK9Di1/XoP2Hl78+q5651hMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMWESSMQAl2AmESdzgTAAXaYCJaNX06l14XIxPGQVmI=;
 b=M8kwIL+Op0eye5M3T20+7abDN6OrkEjuR/m+WPReasx2eXf+tXhoT3xkMhjRhMa/BZ0XUMVXduygN/xg5SKA8TmpOPGvHxZwpulszcMZpjyE0j/dSETq/TvATPkqA1qNPVg3BYeWbsUN5Ub0Obr2oZcC+AEkk9JLgpLWsMcEOrOONOHwNUuQHwTBjlhhs3cDXxqWxYTz0it72pkKiZSalse10B1UOY0yaaVEK0RULZP7Lu9NMZX17D2fAQeHhnutEESK2/evaVSXlUwh19wd8XsPy6vBaZP+cchCJFC6/BcePVjMmmvvN3o7Fb1HioJshwtYVtdZS3zrw+0t7OCX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMWESSMQAl2AmESdzgTAAXaYCJaNX06l14XIxPGQVmI=;
 b=mBUl6ZZzK9VEL/tvOeLGJmzWsEGDbm5A04mjW+ohGQFwioE38JT0W51b088bW5QopxqGrIWY5nm280/znobL3lufn3rT5os844RZy3K3tErIUE4txl/STMwI+A1zAACnLB764zDgjstkjSh+gI0BnTRgz82nCyE91XeeirdQXJs=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1033.namprd04.prod.outlook.com (2603:10b6:910:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 15 Sep
 2020 09:35:36 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 09:35:36 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the zonefs tree
Thread-Topic: linux-next: Signed-off-by missing for commits in the zonefs tree
Thread-Index: AQHWi0JUtjlfl8urUkOQyHJZZwx0tA==
Date:   Tue, 15 Sep 2020 09:35:36 +0000
Message-ID: <CY4PR04MB375179933A970FE8A75C162DE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200915192632.4bc91c9c@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35b45f36-4467-4da5-1e35-08d8595ab374
x-ms-traffictypediagnostic: CY4PR04MB1033:
x-microsoft-antispam-prvs: <CY4PR04MB10337C86FF226F717221C05EE7200@CY4PR04MB1033.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xN4r8R5nPd6C2s2OVR9eGMJY+RbrV3j6zkliiSpMYvjwj1DDNPCUdTxmV/gSNC1g867UTvPrPSKhbRVnNPPf8ky8LJ2g3XCdrvbDphV2IVA2AWq86/AUVZA7/09NsXY3pgB1aeReXPyLHucX1eqzBDeZzv4Qz2FpwpPsnRHl4eE1Yvwb2Kr9TWcCbiL5PcQ06qpJGXtPrZtRmIwKo0kIKk9VfegRGyWf8Mjcn4zWuYpFw5tKDGDaj2trRR+xmSJbYQXVBLMYOCFtmw9E5dhOXrep8AHDhkY1hMReL2J07rFeVXAlB4PSC/SeBYjJS1Xxk0lhfQkm2pKjJ3jI0ePniQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR04MB3751.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(186003)(478600001)(33656002)(53546011)(6506007)(316002)(52536014)(66946007)(71200400001)(4326008)(66556008)(66476007)(64756008)(66446008)(54906003)(91956017)(7696005)(83380400001)(8676002)(76116006)(2906002)(5660300002)(4744005)(86362001)(9686003)(55016002)(6916009)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: OZBzYcpEH+sZOMxdrrOZ8NHw3z0UR+3tOms7aEBno8OpPqnKRf+wHZt6G0Pj9qbHxvNaBYzUBfV/zp4pflmWgMUS7JYQd2/3VkKjz4yRYlbjx36fVi1eEMS9r+y5Ti/kD8X9T6wpWG41aO3NPsNn7ZsO9cHSr0fBguALpWrPmHjjuq8g3QEFR6jtCYaBYsraVD7Kv90TZ48cElVialdMD0ntjBAIrg6S8FgrtV/rhKSr2ZNpDu3m6BJpu8Or9W1doJbwm8KWtSng0Bc4bwdY4d4KWb7AzfQUiGneoW6aSVj/mvcNE3ELAtyihQXwmun2LDykNSvuWtEYE+TzXmDERmPBaWxFcmto/8fba1ucI62zvJCkRXToLAInJGJRSK71/chinwLX6dqGvmlPgWZK6Aw5/+D/QfAle6QJDvW9N8TGUu12LN9mg17uOb6Ecrh4NZPkb8qNNqAohDhTHqhUa8VVTw7U5gPqKBEq2nzItDKGNSLMjsDNoNZB7o04ONFR/BLr/ZpsyM1zZpLZoh5zGSFIIIsCMUo9FnH++CbKN6RRBzGYfTh0t7Q8EYLxTlsJIYdU95hxqA0YesanICc5fJoscE8UvV8mF45VA6swgSQ2vWqMTXEzh/xWoBU0xqTFVKT3Mr+ePI81mlQEnh3xCYDnv3UbPuAjKckugkPOFjrKginL+GQRkC8nmmXRx1UrJXPhgcWwA6cIJgFDfZEkkw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b45f36-4467-4da5-1e35-08d8595ab374
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 09:35:36.4475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uo/N33onniSHdcDruxMdmqRPpAFed3tNTOdHb/ZN7Rgwr9ZRQpqKkL2wIPmxh2CRX6f/FKyNKg/rARu+eVyd9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1033
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/09/15 18:26, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
> =0A=
> Commits=0A=
> =0A=
>   7de0d8dc5dea ("zonefs: document the explicit-open mount option")=0A=
>   7e7dda2cb1b6 ("zonefs: open/close zone on file open/close")=0A=
>   c282d13f6ceb ("zonefs: provide zonefs_io_error variant that can be call=
ed with i_truncate_mutex held")=0A=
>   16ef4f7638ac ("zonefs: introduce helper for zone management")=0A=
> =0A=
> are missing a Signed-off-by from their committer.=0A=
> =0A=
=0A=
Fixed. Sorry about that !=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
