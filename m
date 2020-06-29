Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865E220E136
	for <lists+linux-next@lfdr.de>; Mon, 29 Jun 2020 23:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730527AbgF2UxB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 16:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731339AbgF2TNX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 15:13:23 -0400
Received: from APC01-PU1-obe.outbound.protection.outlook.com (mail-pu1apc01on061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:febe::61f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6DDC0A88AD;
        Mon, 29 Jun 2020 00:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/fLDqcy9DZnyNe8JpODxqvVvUZupcAMBFsgkqOqCNqOn8mlcoy9NbjeRVUgjSKZZzWjarDETi9y8Dt9nRRdvKfOUQGV35pmSHCy1BiZQCErJIXwscMPmDRHhdCpxN/+CFKnN4ePJFnxT1iqJm4pF1GniX7AT+lxvsZYJW0OtnOiStvncETM/cb7vgmVddi1cFYqOs2r+ECwpWdpDb+dFuaMaZkKjHykPKsbPRSv3oJ3RSY6AdyjiFlHVzAqbxSHyk0VUwY0O/rW0QhyTMdkhitCKYc4nk0yLEsnEAqdSR6hdjPjOsfTYwBIExxE0GpeIDU+Y92TJwrNyQq3SFFl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F38UHee9PLqPO4rP08KzZfkN8V8xkSHdYHislmqEJRQ=;
 b=kCIhNyRrMbqX9duwfhGf4wDjmdzCPl4TSqmWJIPUMRRqtnD6fGTWphPf5AFSsM1YWjiwQU+ASZ8D52xzwtrlwqaHcvtaK0EyiGWbJrWI//92TRWpdSpkgLM+/CrHHHYUMxHY1ff2SBGH6V4wUfOPpRkCaYgp+p/sHcPWEfNGRtWhUvWkB5sRATUBl0zbBjEGo2+sFqq9KiicBj8Alu+8Ztz76IcY4e7GPyZ3CfX7+t6yxxo+y4iQcGWe7yFiEylKJRTZKpkQgB9WAf6bAEXH+AmkYSY2LPDJmpbXm4wfdEocqf52Tv7AarifsWyYnraL7rWjJwVWH26f6hjYkvG2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=necglobal.onmicrosoft.com; s=selector1-necglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F38UHee9PLqPO4rP08KzZfkN8V8xkSHdYHislmqEJRQ=;
 b=GrRVE364NL0O/yjGJEWRzmd3mHbrzbIT/PC/K9XmfphW2my+mDvBItNL2TfgIhoTZsf47eCun53inSRXHJdrJzm6pDampBNisPwmGjoeVOYTzokRg0bW6btwPOPAyVePDCKrbQozSflUThbQCvhK5WcdDSUzqOCWAN82204mliE=
Received: from TY2PR01MB3210.jpnprd01.prod.outlook.com (2603:1096:404:74::14)
 by TY2PR01MB4489.jpnprd01.prod.outlook.com (2603:1096:404:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 07:33:09 +0000
Received: from TY2PR01MB3210.jpnprd01.prod.outlook.com
 ([fe80::3841:ec9f:5cdf:f58]) by TY2PR01MB3210.jpnprd01.prod.outlook.com
 ([fe80::3841:ec9f:5cdf:f58%5]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 07:33:09 +0000
From:   =?iso-2022-jp?B?SE9SSUdVQ0hJIE5BT1lBKBskQktZOH0hIUQ+TGkbKEIp?= 
        <naoya.horiguchi@nec.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        "cai@lca.pw" <cai@lca.pw>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "osalvador@suse.de" <osalvador@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        "david@redhat.com" <david@redhat.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        "zeil@yandex-team.ru" <zeil@yandex-team.ru>,
        open list <linux-kernel@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH v3 13/15] mm,hwpoison: Refactor soft_offline_huge_page and
 __soft_offline_page
Thread-Topic: [PATCH v3 13/15] mm,hwpoison: Refactor soft_offline_huge_page
 and __soft_offline_page
Thread-Index: AQHWSjh5qcZg75sKv0mmnb8ztyYfl6jrIEGAgAJ9JoCAAZpMAIAAAu0A
Date:   Mon, 29 Jun 2020 07:33:09 +0000
Message-ID: <20200629073308.GB13601@hori.linux.bs1.fc.nec.co.jp>
References: <20200624150137.7052-1-nao.horiguchi@gmail.com>
 <20200624150137.7052-14-nao.horiguchi@gmail.com>
 <CA+G9fYvopXWr+Y34xz2NVv17yeFs7fuKnJO_iUMnfCwaDNRXYg@mail.gmail.com>
 <20200628065409.GA546944@u2004> <20200629172240.0d01e161@canb.auug.org.au>
In-Reply-To: <20200629172240.0d01e161@canb.auug.org.au>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=nec.com;
x-originating-ip: [165.225.110.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed70647e-635b-47cb-b138-08d81bfeabda
x-ms-traffictypediagnostic: TY2PR01MB4489:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4489BD8B2D0A0A864F1460DDE76E0@TY2PR01MB4489.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eM5YTfuQx2pT07nAcT3gcT3m56qjlEYRs27X7BB28e4e5GDtpDzSJr/p8zyVFwqLSuuOh/fT7WNwWolYCRCZQOrnLXsaoRI0cVmuSlsawd+OePKVATgQiRLgDF7zf8ATZ7WF3e8tU6E1WcmbZWIozVQ0Cli3Fo6hDA1YkW0FOBj1ryZe5Yk+H1V0YcRY/UYn1i1O64HIzP6Kc4WTtL49vz3/hVuCnsbahbLcriSz8S6GXEHwLWCkYSrQY45EztlAQWxdv6NPViGdGM9G3HOmjOb4edMqcSfzu6MFLkKKgsdSZh37ad98wXQWLcXehFyiQvPBxAEe4v5bguKXOK8f2+SytwOWCLiacF7/MMpJ9ljuM/1sTy2cUtNYBT5w9Ls9aaC6vkdPnFB5Emxzf/qGTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3210.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(7416002)(8936002)(76116006)(6512007)(9686003)(66556008)(2906002)(33656002)(54906003)(6916009)(66946007)(186003)(8676002)(66476007)(85182001)(478600001)(64756008)(316002)(66446008)(6486002)(71200400001)(5660300002)(26005)(1076003)(86362001)(558084003)(6506007)(4326008)(55236004)(14583001)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rOO/KBkhOFApDwWqtEYTS19D4ASrgB/NF7wXI2B+grrcKbgC1TtVdTFt7ZVwU8cEBmrF0fpRYmU93uo6aSXLoiV4q1epMxTGooAnL1Ehbvi+sIsHi5IpwiZxUNmWMCFioY3hliP0DBQA9J+7HJfBOsvlDmUgOToZZwFudpt+Mcao9c4TMbeGYR2kz6SAV77knoKz2p/NLFMR5eX8b5B3RYlj81jgfRV9UeiOYom0+6YLIRRnWKSmx3/9PpnCJ/DLV3jYVrWJFEjU8zXm+8brTPQ5ZEZ/DnjTitkH9lGxKwa7fhh16aSJnE4kJDnyAZp2/DmXnd69LEr6HPVDTf3NIZEA84Js7c0rJ29mwh6ShA5dIzVpiajHATHPLs2EGSaSOL5SRN/IfzkhV2p7w3Ciav8n7YKkbak3YLVjXfa3meWuYjUn5vKcVWG80Ibh/ifwhkpIudCjnOGDcZk2nnazaQ1pgQwQ8o3exEcMumLerZDaC0HjGcI4VFq9BYs9eFJ/
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <FF71F9482B3A7842906567E039AA2DED@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3210.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed70647e-635b-47cb-b138-08d81bfeabda
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 07:33:09.0944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbjcrtD8obUudFKXyNdR3AD99c5zZvZg8fYYzuvrBw6puO9qh6z3yijBIXtgeqZ0UIFTST2RfPawa1Dw1AzcUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4489
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 29, 2020 at 05:22:40PM +1000, Stephen Rothwell wrote:
> Hi Naoya,
>=20
> On Sun, 28 Jun 2020 15:54:09 +0900 Naoya Horiguchi <nao.horiguchi@gmail.c=
om> wrote:
> >
> > Andrew, could you append this diff on top of this series on mmotm?
>=20
> I have added that patch to linux-next today.

Thank you!

- Naoya=
