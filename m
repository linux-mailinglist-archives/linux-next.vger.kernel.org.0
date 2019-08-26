Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F205C9CFAB
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 14:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfHZMhL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 08:37:11 -0400
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]:56126
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726593AbfHZMhL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 08:37:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+zwjdMc7VMR3QNDC11ZVZuj6CXdYSmzwgGISMifTFFFshtoTxyM+pyDiU3A3foy16GXxRNpILF3jsh51y4iKwmz72e3nonOBEvuRMNHci59Q7qhvKK252zWuD/OJKuVhAnPYuJF5mS/e31LyhMzLJiJmlzUCT69Xa/3SPqEpI40KWfqI29XEyYoXVWD7nAqAYOgIeJ/Aqfs/xLpgpuCUalkSBT8VJIREUUvCksESyf+JGEcTuaLnIgYY2R2dvzmhCo+I+qua6lQSgDdSz78oH1gCyQuGEL8/YGU2pZ7ePpAGFkO+1Mn1Pc5Xt6E9kcfFOiQKid+8hlNRJYUXWfpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ApEkK9rFxuS1xYcaRD6zKBkjhc/Ycj9qpmreMtnvdQ=;
 b=a8hXmhxubMDSugRteiBSKDfgdCOx0OgPp18eOmg6KP2bujaDWO8U5wIEF0wI7+eToO/2QZg6eAyBpJChz3ypUefITMuokuREdbGPTI5ZcK/yCFSXzfMIBjmyQxdeJwE1ka6kJbk6QBf/cMoU6H0tsh9JS34oQkwb6XCHpoa02u+9Ev44FkzVtv/hp1ZO4Rh/2zGmiRkcXC8/lRaztDYiqHrfDtQKw3nlxRlXYqi5ImVt0C3ik301bZQRod7YOWMF287IVwRg5OtqHgOqbek1PF9TjPccoXB3VfLiSeWwtNxw+oxsR9vYfYC6Xjlw+WtAwzj4yN4taoNIfmVOa+DOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ApEkK9rFxuS1xYcaRD6zKBkjhc/Ycj9qpmreMtnvdQ=;
 b=XL+bDEK7B0yclCVidqfI0PgIHEVM8x+ziLO723FZ1bwbldltSl1xOiIHswOfp28ppDJWDAp720i7k6bECOjt89jU3tFqAbm3oelPWE45MHC/lXitj5nB7z0WPmrVINkjKTW5PffVlJwOZy+fTusosEhC4B3ElZ25LZk4LQ8cLok=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB7117.eurprd04.prod.outlook.com (10.186.159.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:37:07 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::c5e8:90f8:da97:947e]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::c5e8:90f8:da97:947e%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:37:07 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the devfreq tree
Thread-Topic: linux-next: build warning after merge of the devfreq tree
Thread-Index: AQHVXARyCv+yIWXFPU6154KXdXRdnA==
Date:   Mon, 26 Aug 2019 12:37:07 +0000
Message-ID: <VI1PR04MB7023A04E222269DF4EDD3BF5EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20190826215017.02ab0d34@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b9a9c02-ba2a-4a1f-3b10-08d72a221b92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB7117;
x-ms-traffictypediagnostic: VI1PR04MB7117:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR04MB711754057A0CBE497A608DA7EEA10@VI1PR04MB7117.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(53754006)(189003)(199004)(5660300002)(305945005)(6116002)(3846002)(53546011)(102836004)(6506007)(53936002)(52536014)(74316002)(33656002)(25786009)(44832011)(14454004)(486006)(966005)(476003)(6246003)(71200400001)(71190400001)(55016002)(4326008)(446003)(478600001)(6306002)(9686003)(6436002)(86362001)(229853002)(26005)(7736002)(4744005)(256004)(14444005)(8676002)(81156014)(81166006)(8936002)(7696005)(316002)(186003)(66946007)(66446008)(110136005)(64756008)(66556008)(66476007)(2906002)(66066001)(99286004)(76176011)(54906003)(76116006)(91956017);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7117;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BsmStHnDDL0B51iq/x6odSzCcOZwFZY/mRePHijJcM9QEHX1F/Kw1fs22Hf2IbxzyzR/uzWGEsRZdLMAedjbSoyM6+MoE++DjARttN2jcywQUNcS4AkbEel6LExhaZzDlw3CFZP5yacxMMaGQr1t1DiIotBz1+7HTfPc637g+MABaX69uYAd2HZahpSSUuRXr3Imdl5zk9QrCcb9G11MA3YZDlROpDeDqh3kPyUz2HITKmFPQBEmhg2BOjNTo9Mezdre0j1q6gpQcIegB5e42h7pNex6e4KMyiSa/0No8eCjAHNTCL95e+OftL0fsdSR54vCr6vX8PefYcdwnAf97oXa6ZAoQ5vx4ADHTs640UkIu3nhYkL2pdahhhfVt4mJmro0uzRKQ3oiDhF7of6dpEeO709RxXYEv4CbJN6FuVo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9a9c02-ba2a-4a1f-3b10-08d72a221b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:37:07.4696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +w+Kevec85qa8A6QK7Xqqplfl6V1VQlBTPe67VGSls9wKVLHhNfLZ0e3CwiFImsI15H3wajFKEX+JoVJGBFrPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 26.08.2019 14:50, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
> =0A=
> After merging the devfreq tree, today's linux-next build (x86_64=0A=
> allmodconfig) produced this warning:=0A=
> =0A=
> drivers/devfreq/governor_passive.c: In function 'devfreq_passive_event_ha=
ndler':=0A=
> drivers/devfreq/governor_passive.c:152:17: warning: unused variable 'dev'=
 [-Wunused-variable]=0A=
>    struct device *dev =3D devfreq->dev.parent;=0A=
>                   ^~~=0A=
> =0A=
> Introduced by commit=0A=
> =0A=
>    0ef7c7cce43f ("PM / devfreq: passive: Use non-devm notifiers")=0A=
>=0A=
An older version was merged somehow, this was fixed in v3: =0A=
https://patchwork.kernel.org/patch/11091793/=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
