Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415E83237CA
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 08:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbhBXHSA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 02:18:00 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7599 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234362AbhBXHR6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 02:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614151078; x=1645687078;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=JCgq/fZIYfL1NBWPvfifLP6/g5M0MsRdN/XkvGRVzB8=;
  b=n8ATkmxbxABFUMQJkp8cGT3eZBW1oKGNbnEXZbbMkDMmtnDEohruXrD8
   MB35Hiw9EC9ibTaMBwrgdRE9pFn+zNarRSTfRvVeVvmk4ve9kCOczRA3a
   ptap5nm8cyHMjZrW2I+H4rW3nU4YtAxFXuCCS6mL/X3oCeIinGFxxEODv
   OlUepIKDG0Q7gZFXudvagqUipo1iXAJ48OAGyAaA7IoZlads0c0uwZpZL
   o7/Q3wpOH19y8nF4cPcssOVI0R64bCfMqHx6c7UsfxqbsNhpvUemfAU4y
   y7FXOeCZmlPG5BpAJqvSISXfpptLW7uUg3oSE7Z5n6Xiyt4qfaVPjKuF0
   g==;
IronPort-SDR: 1tr0hb7KTxfJkybsLcOiq18pOJqptrg9hJocPkYvWCty7mfw1JYhfRJog4E8YuNOjvK7WbwOp6
 CNSFJh6SYw9YaEbjT9d+d7wsZ5GTVqgiip2hCq8fZoYU/M09vlpnNsGVk92e7fQFIGY2K752q7
 dzzXki6vMlOXiPnzh3/J61G1OOniQqVZGZEJGiPYBSpTGLDsvFUvDXUi/S7Zmz6FVoSWZ5txtQ
 4ZlBrQC/e62NB1DXwsZWyW0dIHhpmDSqFHTIoCxKUHsz1mAqMb22S3wyYsOdc0drWau6cLtNJE
 X04=
X-IronPort-AV: E=Sophos;i="5.81,201,1610380800"; 
   d="scan'208";a="165150735"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
  by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2021 15:16:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiDFAFgmZ35nB2cE3tKi6Oe2irN8LC9ve5A4vijaYPYxv3av2yWdxkE/lHvNvEARjsmIsbGPLzVi9LZ6fO/1Dbwmo7VkEDBL/XY/H40NGNWXXtX63CUCL3UkgrPtMMXWanXLvIrQxWTg2v9W1L6TmyfajiLm6hBQx0fvjIyQ8Pm7qSQRjV9+uRrnI0ewxUYOFYa9L4kKhH6buKQqDXuYwfDZt9UKfheKOD5O+5sC1APEYHDt1BJOVVGuHME75UC9CrhU91+Fb9nrwPNyaidSGMk6+OIIQc/2XE0IsaB1lv0HokvfAVT6img2n7OxSy0SF3RAw/pA26vapAHENXmdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGyDgdkQTpSUmuFvkgSC2fea5sjnTTsj+0L9vi5NdYk=;
 b=SS5e5NcBx3t8VGqCjJmxI/z/zs+ddw2fqryWuh33OiLpqTxrcNxAbgZBDFDmqljayh8kAOjKofymBxPNm07gO/1bomEacR5HNX8Bdr7JykkT4yA+b+5kE22jWs+IdP6F20WyF/noUT4wG47p/KeFpiAueSyFa2d2YshH1rFgLv+IVqbjC102GsyqIOB/6SGxpeSB66UdYgr4k9rvYcXawycHLvRWMuHMEeMLj2x8/IeIfIaoBJ32hlxAKgvQ8x91dpLS8AWLMySD0IUWkLSMo6x8c6PgRD7tpEnxW5B9h74XTKd75gH7ZdkkivuvoNeY/UKHW5aoE0qCwX0BoLv4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGyDgdkQTpSUmuFvkgSC2fea5sjnTTsj+0L9vi5NdYk=;
 b=ReMq56yCFv/JMDG0Xapb2wBEysrjHWGBP7uc5p0l2fHLCPhj1s5OJRbWjt3Oh3KGB+Q7ELds/aKPu/NpoNrCIzz8dXaAg2CFp0eU3P7Sf70A3O2hx/a3GkL/77I+GIDWfO7iKAgdfQmD81aGHn7XalmYUONmbRxVPFTFLsEbiNI=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB4325.namprd04.prod.outlook.com (2603:10b6:a02:fe::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Wed, 24 Feb
 2021 07:16:50 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 07:16:50 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Thread-Topic: linux-next: build warning after merge of the block tree
Thread-Index: AQHXClUzpjkXmk4Idkajps6jemEJ+A==
Date:   Wed, 24 Feb 2021 07:16:50 +0000
Message-ID: <BYAPR04MB4965AE6396826CA344D7671E869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
 <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224163320.2d8d810b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bda539bf-e343-4236-7ba4-08d8d894278a
x-ms-traffictypediagnostic: BYAPR04MB4325:
x-microsoft-antispam-prvs: <BYAPR04MB43254EA712CA36B70960E737869F9@BYAPR04MB4325.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m9PAqaUbLgeOY/GQsZaIVYmzUp7ZQqFBtF8HjOj5KVuLL8hrB/EQJLShJIyONwC35RxUvgGTRVDfkUnJ/LB5i1rG1f3BUugbEkkcVsP4wO8I1jJ41pR1c25da1chSmLscsjCHQPjWWEZdYr5nWXGlUpbS4R4RSgZrQiOYMdRJRT7yLpRrOVE59G/ibNRW7QVEUrp4TQxSZbnYdZb3hHgpZl2ux4uwMGcAceDrWZYJzR5stIDpFCfQ1TCfrzaKqxnf1VZh2ZNSX4BJHIp7qKtL2wr/HSyf25ffgH2D27mVhCIieT4KWW3iDqc7VeVxNVOiFFvI3EFsVDz51exqKrk3D70SDPXT6wDF1CZdnwhXwT2BUu6FXs8bJ8JOBFsPuy2xDGobBikN2+2vcIU8KRiDBxPBcJKX8LkFvIb3fyDxRD7mIEgpdBVyGwIeXHcP26YG9MkThsMHWUKwIXOEym4lwZNqU9X5PnyEqAW1ed6RQj/y48GvaJXbduHVcTglthGIPOOxptyQR6hI8aziFnKnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(8936002)(52536014)(55016002)(83380400001)(71200400001)(4744005)(33656002)(6916009)(316002)(9686003)(2906002)(86362001)(66556008)(6506007)(53546011)(66946007)(5660300002)(64756008)(26005)(4326008)(66446008)(76116006)(66476007)(478600001)(7696005)(54906003)(186003)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Ws0k0LjRW8G+1bjRXJkkdfnj6ZhoYpCbvgfLedrAGxUmhp9Gf0RcZxTkrhnd?=
 =?us-ascii?Q?Yla17zEU0XqYg+VnTORlve07MILW9HdIeM7pHmKFq4VH//UgB24Eh+R1UK0y?=
 =?us-ascii?Q?ThNaeT7C2QFKX2ONw899OWksfByOY8bmg/UsltWd31ZVAlDwhre2fTftx7As?=
 =?us-ascii?Q?AEmbtOuRrFGU3IPqMAM/I0GnA/J4OTErsAnLamVSymCev5R4e7f09sCUaObD?=
 =?us-ascii?Q?c6M5qscVrElmWfC4QI2YALLniZFVsdACNrQLvCugxwxvhOV9RmsP3oQ8eaU+?=
 =?us-ascii?Q?8s1uyRRY55S3u0qGX6UnbeceQ7kiSivVE2I3W1v9mBDxWnGjmSKmw+ThbHqf?=
 =?us-ascii?Q?mwckxv/dX776MqqwQN6F80PBA7bYvXfE78oisLYsTSmBjJBR07SM8Vz3BdXX?=
 =?us-ascii?Q?iGQMzuXPfTwqVopWbdNpQ136+VymYBG62B/hgutlN6vTjlveZ/DZ67BY82Cp?=
 =?us-ascii?Q?ylM/4pOi8oOXKO6AB/yBd4DgytpdO62qF/usBGrA08H3NZJLImon42K8ucuc?=
 =?us-ascii?Q?rZ8Dhgpb6uNl5MFuqypLcv6+y3B5aS/mYNwSrHwVbbUIbGmWbESR6UlCISrz?=
 =?us-ascii?Q?7nsPY43mejqze/N1WR3XTErQP/9BJzCcIkSVQXJSDNVnZCY6GZZAaQBfITNp?=
 =?us-ascii?Q?/ITaufo2s6rto3JoYktMz3U5tFHDJl823zFK9tkTdphu2iQLK9eCNgS+qEpj?=
 =?us-ascii?Q?ML1esC8QldW8AohJO/5Zb6iSeXAgNrsiZ5atcTthHOynVRE8s11+nlz4Bgbt?=
 =?us-ascii?Q?Yi+f1UcbKLfwI2JogWT55oi0zyjENrdeD/iGNPuAAXdIp+8M0b0jBKAHEFGH?=
 =?us-ascii?Q?5Jg2ycRARMD8DAyw5vQfVXQRy2Tu5M1JcdmHzMh4/9xNCt2AVcRv2SE1KGfV?=
 =?us-ascii?Q?MpB6JBZicHrWIQlJDumTUA9Ja+DdKyKYeg9zoKreegCTAfzIdL9wexeuAMdA?=
 =?us-ascii?Q?aXxtwdJ5BpO17uRoXctfIIkqUtuWdH0LzEFpbj7XukR3+u94aYAmkKawlx5o?=
 =?us-ascii?Q?SSHoxllS9i9XWnDqcKjVFZxCsIkgrPypzecBn5JOQoTgLbuW/lqkPGiKS8Lu?=
 =?us-ascii?Q?59DxFr0lW2NI4C+FWRp13hFuIsTsVKebeDzPOWuC4nsjI9B6dCGZ2ug00eFr?=
 =?us-ascii?Q?jjGu1q/O9JsUNJgrlEZDf0b8BBgmEpemXU0BAjj/p64VoC9hxwBANAaNhbTi?=
 =?us-ascii?Q?ovRwwuYrUZPPxSiGyfHJYlFGrAOkpl8BIoBBjV0pNPq6ZVZ+rnbunEWrQkZy?=
 =?us-ascii?Q?Oh+ayebuKy/FJQCcf+5Ud4gw86a9KKk3XEvbvcZ5C0xdppmLVmB1giNPgLI8?=
 =?us-ascii?Q?e6hq/H1npsbkKoeR0hcG2hhF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda539bf-e343-4236-7ba4-08d8d894278a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 07:16:50.2042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFQENPuf8EnhQUu9WjKFCyQ2581qFSvtRg4hKsuE1O314S1GfOgJpPLXeyAqhwW7nrBYQLYUj1ixiTWBb0+84J3XfiDzBr0kTUhrrmTGgJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4325
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/23/21 21:33, Stephen Rothwell wrote:=0A=
>>>   1f83bb4b4914 ("blktrace: add blk_fill_rwbs documentation comment")=0A=
>>>=0A=
>>> -- Cheers, Stephen Rothwell  =0A=
>> I've failed to understand this warning as rwbs is present in the doc hea=
der=0A=
>> and in the function parameter :-=0A=
> I presume it is the missing ':' after @rwbs in the comment.=0A=
I've sent a fix with your reported by, it will be great if you can provide=
=0A=
reviewed-by tag.=0A=
> -- Cheers, Stephen Rothwell=0A=
=0A=
