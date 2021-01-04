Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256732E915A
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 08:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbhADH5N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 02:57:13 -0500
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:10492 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbhADH5L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 02:57:11 -0500
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1047eZWX001645;
        Mon, 4 Jan 2021 02:56:12 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by mx0b-00128a01.pphosted.com with ESMTP id 35tkfeaq0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Jan 2021 02:56:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlYjkJgQbOG+ggE1wLMqLCpvVQYliXVFI1f9e+CERsZ437aHbbwdp/r0WblvauZyLP2rKHAntledT5nQ2mGZ2b9li0Ks1asKSzGKxjP4VlrdlSCdEdx/hkCj9oDZFQuPmdCOdZgKMMTNjglVw+mVgVPI2mn9WoEJdfUhcwUe5eqqRNFt+ztcwGrws/lVdGiqMrNWJl7gllyMbffa3acdFnvD09haFK46BTboM9tG/hm/YQCTrSa9GJjUDGoJeuzJz3urr3dy4aBz006QlHX+6MRmEO2m0qjHlGFE/5qlN5dNTFtStxtaov88DyNN963RABHkBweLPMuzHnW+n27qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls0LmIRmcZ3dEaEQ8UndvFCZOSOObiXnagPsXz8aWl8=;
 b=nvqE09/pekGGYu9UUIViD64dsz9rnj06nSodph/eUw2dtjVMoUh3nMcCSTmZahaBTs7jnNEzvXOVgNItPsKnsYNz/omFmocFfkbj6NVeqzcsCasA9dkzVMEf6HfysvWkipeu5RxBsubbPDlhXJqyqLr9I4wyUfwCd6MQRWQf/auee7d4qAxvDWv448oZwBW/Pdk4rCUq88Tb00B+9Jb+pTrE/lQ9phBiHPp9JbqzcTLYhp3LC/jHmh9aeRHtBex2hxEIxFqB/wPT3cZfJTC83rYzT5ByPTbtvzAhYm/NbbfygAnkWUCdGA9U9kSkesbeYUoRUQWSifYdBxbil/qGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls0LmIRmcZ3dEaEQ8UndvFCZOSOObiXnagPsXz8aWl8=;
 b=S2pwnnPc/OwNddtj6/tcmkTfs+RIIHKSrDvutiBJptp7oWgnle5eMnUu24FOYbezralru+LXqZ+6BbfJFZD23ZXYY7ZhnVC3vjm8AR/mVCUWgP0VBfYAjsB5HL+qD4A4suoDU4czjHBWmq/jWMiA85tceW+aUzaEBnM52el+tMs=
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4906.namprd03.prod.outlook.com (2603:10b6:5:188::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 07:56:10 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::e4d2:490d:16b2:25aa]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::e4d2:490d:16b2:25aa%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 07:56:09 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the spi tree
Thread-Topic: linux-next: build warning after merge of the spi tree
Thread-Index: AQHW4i2ApjQKBoEbTEe36vsYHfBSYKoXGKpQ
Date:   Mon, 4 Jan 2021 07:56:09 +0000
Message-ID: <DM6PR03MB519642B53D98C4E6E7306132F9D20@DM6PR03MB5196.namprd03.prod.outlook.com>
References: <20210104110638.50b7a9ee@canb.auug.org.au>
In-Reply-To: <20210104110638.50b7a9ee@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy02MjFmOTYwMy00ZTYyLTExZWItYTVmMC00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcNjIxZjk2MDUtNGU2Mi0xMWViLWE1ZjAtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSI1NTAyIiB0PSIxMzI1NDIyMDYwMzUx?=
 =?us-ascii?Q?MzA1NjAiIGg9Iis5eEk2YnhHbG9odER2QkRNWXIzNS82RkNPZz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?REFlSGdrYitMV0FWdHJCcTBWMUN2VVcyc0dyUlhVSzlRREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBN0s3UHZnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=analog.com;
x-originating-ip: [188.27.130.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5708151-b77b-4e66-b8a7-08d8b08632f1
x-ms-traffictypediagnostic: DM6PR03MB4906:
x-microsoft-antispam-prvs: <DM6PR03MB4906D7BEBAFF93A2EF2C2A6CF9D20@DM6PR03MB4906.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:18;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MlELYFMcuRiQi7+mJJ2YK2+uZ+A5HZvyYFOocXZ7llkPDAVoaU6psUEZ8Stxd6KKrDDogRB1CTmrXahaEzNex73gJD/KEGX6WMOujDVN/ScFSPhzL6NIOmXD+RM/8SbAhfi27+yptDI62+MhcQJzq5AbBVLtvsC22jEW5vFpvMZ0aJKjtHByUyOWFraVMUNypdJoyXOqACQYP1EW9YQW4qZ5gNXSgZkVRfPgRkIZ3wDYdGSEDtcoU5WI2IVfZX51fLbxpOtOiq3Se8kjysjc4/6SOYtZo+UinCMJmPihOTiDIPY2swbWLoHFUFYz78QrROrue1YXI5gXj6jkOT6u+gwpRQlO4KsZ5sehJT6Mf8qEgBi8YsPa/s6jt6duUT95yj8+HLXkA+FsZMZhw39ndA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(186003)(64756008)(66946007)(53546011)(66556008)(26005)(8676002)(66446008)(4326008)(66476007)(5660300002)(86362001)(2906002)(478600001)(110136005)(54906003)(6506007)(71200400001)(8936002)(76116006)(9686003)(7696005)(83380400001)(52536014)(33656002)(55016002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4SlW+Q8xYGIQB1+CXprIcxHSvHakxLFrwrnx+VmGJcotkoH25GxBziOZs2XE?=
 =?us-ascii?Q?D/AlIfISKDo9WvymGY9OUCRP7UVj4q/HQkot01zClXSOLBDeVfJ0MrUd5N9/?=
 =?us-ascii?Q?iXwrNDxNnUSxXK1uDa78ZnFVJQ0/RATVrRVkLcKV6wrUghzDl169wq8EP7Sl?=
 =?us-ascii?Q?CkdsLtQWWA1jpSs+GI5TufFmKvLGY1EculPylZuBS2GyC4TKdeD306xVox5c?=
 =?us-ascii?Q?/nCQEq/YxfUbe/2Al35wDRWiMcCdlVnpWXugPUKERinQgmI8Ui2kz1zmOyn/?=
 =?us-ascii?Q?YqVJGzHXEinxQTfGgFSpXI3SOqCbKXxbHiIUMNdraO1LYzvpIzSjB2JwcLlq?=
 =?us-ascii?Q?L4ZrViIaFGg3eDxmwj2WmrLrumsAx8Lagh5UdN1kDTZtfZfsXJDck0TxSUSn?=
 =?us-ascii?Q?m+KshpB3zGkZEJXVFnAzPxiVwyn1glD5i39iH8PnT4M/Zi4rsEBKLWJ1xO6V?=
 =?us-ascii?Q?Je9157vGr2ajenZ5ZTmcWBOWeiEENti2sguTogcOAVA4ptY0A6069z0X6oXa?=
 =?us-ascii?Q?Uhvd6sTdxZeSfmphEt5nNOrVar8EBort0VgALS6t4jq0frIZu2wr4QY3lvYv?=
 =?us-ascii?Q?+0+uOxRU4sVWbQRYWSkOAH1bbUCZHd+BzVdVOmvC4pywMvUkEt3d8JgL+CzP?=
 =?us-ascii?Q?MB2E9xivYBDCFzUFfKOG1Z98XigQ2Fv4DCpTM0e+40k0pXph/FtDbxxw2NSl?=
 =?us-ascii?Q?UnZ+BsHJO64dm/JwBc+BSMDdYUANjqx9/ce8vBJRmfRikNoKvzw5g7HvuTbs?=
 =?us-ascii?Q?DfcI2ZUPrRHIv7aPqTiBzjUvkh3hznsw88SrjgtiksYnOoaxh/3Rg4Kgp03Z?=
 =?us-ascii?Q?KlQF8iAr4tqq5FjZJrS9Q2Eqkt/SUXLS2A1/6HpGxd/xBOWpkNVXprYhpvB8?=
 =?us-ascii?Q?7czHtxCraJJxwReC6Q+9a9c4qyfxAhSjqVjD12mQJKpOHFhRvRbp9c+eGFWJ?=
 =?us-ascii?Q?sapFzWhzvYLLdJcT9THqRXm6IHmtXsLl6DdC0yVCma4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5708151-b77b-4e66-b8a7-08d8b08632f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 07:56:09.8389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUtl7JbkiPfyARHY/MIXUueBChDEW5koQdSVy9nRl0/4tB2RfjS+wtibh6SOdfT97olpOSeu+wHJtE2saMNh07h5WioLmNorHmmD+iWz9PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4906
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-04_04:2020-12-31,2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040052
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Monday, January 4, 2021 2:07 AM
> To: Mark Brown <broonie@kernel.org>
> Cc: Ardelean, Alexandru <alexandru.Ardelean@analog.com>; Andy Shevchenko
> <andy.shevchenko@gmail.com>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.=
org>
> Subject: linux-next: build warning after merge of the spi tree
>=20
> [External]
>=20
> Hi all,
>=20
> After merging the spi tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20

Apologies for this.
Will send a fix.


> In file included from include/linux/device.h:15,
>                  from include/linux/dmaengine.h:8,
>                  from drivers/spi/spi-stm32.c:11:
> drivers/spi/spi-stm32.c: In function 'stm32_spi_prepare_msg':
> drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of=
 type
> 'int', but argument 4 has type 'long unsigned int' [-Wformat=3D]
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
>    19 | #define dev_fmt(fmt) fmt
>       |                      ^~~
> drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |  ^~~~~~~
> drivers/spi/spi-stm32.c:1030:27: note: format string is defined here
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                          ~^
>       |                           |
>       |                           int
>       |                          %ld
> In file included from include/linux/device.h:15,
>                  from include/linux/dmaengine.h:8,
>                  from drivers/spi/spi-stm32.c:11:
> drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of=
 type
> 'int', but argument 5 has type 'long unsigned int' [-Wformat=3D]
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
>    19 | #define dev_fmt(fmt) fmt
>       |                      ^~~
> drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |  ^~~~~~~
> drivers/spi/spi-stm32.c:1030:35: note: format string is defined here
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                                  ~^
>       |                                   |
>       |                                   int
>       |                                  %ld
> In file included from include/linux/device.h:15,
>                  from include/linux/dmaengine.h:8,
>                  from drivers/spi/spi-stm32.c:11:
> drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of=
 type
> 'int', but argument 6 has type 'long unsigned int' [-Wformat=3D]
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
>    19 | #define dev_fmt(fmt) fmt
>       |                      ^~~
> drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |  ^~~~~~~
> drivers/spi/spi-stm32.c:1030:48: note: format string is defined here
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                                               ~^
>       |                                                |
>       |                                                int
>       |                                               %ld
> In file included from include/linux/device.h:15,
>                  from include/linux/dmaengine.h:8,
>                  from drivers/spi/spi-stm32.c:11:
> drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of=
 type
> 'int', but argument 7 has type 'long unsigned int' [-Wformat=3D]
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
>    19 | #define dev_fmt(fmt) fmt
>       |                      ^~~
> drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |  ^~~~~~~
> drivers/spi/spi-stm32.c:1030:59: note: format string is defined here
>  1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D=
%d\n",
>       |                                                          ~^
>       |                                                           |
>       |                                                           int
>       |                                                          %ld
>=20
> Introduced by commit
>=20
>   f7005142dace ("spi: uapi: unify SPI modes into a single spi.h header")
>=20
> --
> Cheers,
> Stephen Rothwell
