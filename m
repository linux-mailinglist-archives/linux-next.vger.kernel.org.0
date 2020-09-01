Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103F1259E0E
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 20:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgIASZr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 14:25:47 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:55454 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726107AbgIASZl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2020 14:25:41 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 41F3AC0090;
        Tue,  1 Sep 2020 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1598984740; bh=GQv+aB3Bo1VnEPYdLq5Myc0vB6nO8Pe+tlwKwUVDfK0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=DLiEuhMV6QtfmnJ9sC5HCQUh0F4eKJD+fB+4u+CS+n2gvWJEmxuKrQrum36fgPLdh
         jRrYg+mO0UHFtSP1K29eFpZaLehEZE3Iog/dTW2PsW8oXPAhEISsuyaLilU7lpOip9
         vcMBXIzj/RdglEtbSs8WLPkT6ZxhLWoJ6hcNCX/2q1dRMFgk84tx3mAIis6nikPF/g
         Q/KG+zFzGjXf5XjOj3F4EMZgM8vMJmsxl1WHYHMDeBZ27w7xP2KHbB55Z6aj0qLPRN
         3ULHkBGnIxDJJHZw30uQ/S9vBFDcV6Xf66vhDlPIdHJJG28/aSHHpdYXT85WxyzAud
         XTTlFshxCHQ2g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A58CFA0071;
        Tue,  1 Sep 2020 18:25:36 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2059.outbound.protection.outlook.com [104.47.36.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 966E18000A;
        Tue,  1 Sep 2020 18:25:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KgnDNEPT";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWlcbfLk5mbkluKOUl7cjbNttuNcQKwC5svQ3zcy5tM/Suw2tEMSY69z7p+N5udBMaOYaLWduskftc9/iMep3xU2pefL5BDkrriBJlVt0u2PV2yzCtPBrTDUcTmnNx18Xz3IuQekl+UTKv0JRlA+vhT/c8H4xQt8KKdkRFhd+gony3HjQjp7Ks6slQfrQaxaHfMIdLTeodun+o2f5DitIZlvRk6ajeeKUkzxgOpG8gz5Bk1b3GZkQubbU936iMa5OziMA89kpR3GHTFH86a7ts6yW5ek0nTkEzXY/noOLQrKY8014IciM4/QjzJQkTA63FCylshGKEC24dNEqfhrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qar2B78Y+L5vPudWPJ5vhWEGvL2XziLjb14eXQmmhJc=;
 b=Vp4DoCqt81IwAbWxDNDGjDH/uQBB9UFRACpephYwSsBKGFSR8TA6ycMk4AeCqK0NsD+NPgX2A0ZNqvnpIarno45rP8wZlfvSpzXoW8ugGF1piYz5cuP5EwNkoadRsIAbuJLwOXt4bYbNCMT+aobcN5JfJCdA6p1+Xp7rqlNFhuQHnQdb044FJ0NlIWxhuBu+hLSIf5wKL/jLKrfw08DfpHpKi18cGqugat637jOEqM0Mo3OFxr7UCm4ldmXJxkB/wEbi+GPDpsBYlFGVqQDfqWLdINoKktmmYoMRhoWIXyPAZ9/lr5DcgSEjn48GHGKRmdz24kCQaMgNb/acrC9oQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qar2B78Y+L5vPudWPJ5vhWEGvL2XziLjb14eXQmmhJc=;
 b=KgnDNEPToMxpeLv92Sl4YPqOJIWNKZaznoKKd2Susf5SIdwHdB5de0iOiOFngrxBievJttng2BNI64cvYYLYAjIqfPsiGCb/pEDKBDkG5XygFjGjbM41OTRIFx6DlBJClWjlXz9AlCfBvycxF7suTLoZCdUTv7I35UUhwLRPQDc=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3684.namprd12.prod.outlook.com (2603:10b6:a03:1a2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Tue, 1 Sep
 2020 18:25:30 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 18:25:30 +0000
X-SNPS-Relay: synopsys.com
From:   Vineet Gupta <Vineet.Gupta1@synopsys.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mike Rapoport <rppt@linux.ibm.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the arc-current tree
Thread-Topic: linux-next: Fixes tag needs some work in the arc-current tree
Thread-Index: AQHWgDzhn7xIpMUkL0+Wa/kLEL8h16lTf70AgAAoLQCAAHImgA==
Date:   Tue, 1 Sep 2020 18:25:30 +0000
Message-ID: <456f8a93-2467-7a73-3db4-2231b7e91e25@synopsys.com>
References: <20200901184928.057f6082@canb.auug.org.au>
 <20200901091308.GD424181@linux.ibm.com>
 <20200901213656.4d216c83@canb.auug.org.au>
In-Reply-To: <20200901213656.4d216c83@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [2601:641:c100:b9:9593:5cb1:ebc3:8ee9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dffba29-7cba-4ca6-261a-08d84ea46879
x-ms-traffictypediagnostic: BY5PR12MB3684:
x-microsoft-antispam-prvs: <BY5PR12MB368469995E8ABFA515F1FF72B62E0@BY5PR12MB3684.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:166;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 42o2CI+YnWc65F2CEztaIk+VJLXcMKEcglHn43p2wHLG6G1aUxYN+lU2pmmgvJT/4anDHyY7fZod4QM6Usp6+a/o+wKPa/4XKoerqtGyM/2aYr7X3KB0CgTStk4w/bVqerOJl46MBGrTb+9m/H/9ex3xAz6OLXbOeTyciqBIr5EsVxZ9mwgMu6apguN/uWn0u/f9t79psaDT7OH2C6Au+X1RzgAj+qKb8PQ+n9nQh7IqlsSvnYMMyWN/Puk4THqmHmTeAqB/ERBpkPIlckAKTZ2Rck0qIK9HPqihwvKE31fM9947nkpLwt3mmzE80vg6OTrt3MJhsmtb2ea/oMfasdmQQY/Z6nXJRJvKRotoDQ6Ktk3Q6GC5ygb1C8Hrq6E2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(39860400002)(376002)(366004)(5660300002)(110136005)(71200400001)(6512007)(4744005)(31686004)(6506007)(8936002)(54906003)(2616005)(8676002)(36756003)(6486002)(31696002)(478600001)(316002)(4326008)(66556008)(186003)(83380400001)(66476007)(66946007)(53546011)(2906002)(76116006)(86362001)(64756008)(66446008)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: txVlzhzTaSRwZEbUEO3xXh2nnVSkq7483P+qEmk+/uvczdftLXiDFD9lkk1cel+McbfhLLVPB2BP2U966TCvQXADsxE6QDPjJLnDb1BlEZNFmcFmuWNOVfhNYI6M/eGFdGBpuXqmFn2WO43bHB6MPueZ6Wm6TYTELUJekJjID123cVNKVdTWcko+9w4+hr4P01t1kXBqlxLQUSgPvomfvjjyGl7JRG2Oi2pZB2Re7hoPr4WGFdDDK0iN8UHg+A6J4vdrUxZJHI6RRLNMdmeQZUDZQzOoLS/QMuGV9aG6x2YLhpdJVpaml2fgVJgTaCHGcPPEExicB4REBQ3JsrhL0kjLu9u9xdl9mxeo6ijPxeCICyuDcOZnsK+KO5emps6X/kSwPYhYywJrvaANxS4dy570a+tjzIqNrAl/Ig5lCSeGPhaz1wxq76DdiukjgKjaKyDJ8dcNOlkZMyY22p2ShR1Xvf+kpafxLopof6UYb1hr86s/QhcPsv0UzJ+vnnCKhvS42miQhgiPYgAsvIPztG1biOiNuquJ2Nr0QBWRmDC0dxk8oRdR8qJiFqAtuNySZMDB0XORenSBv5Ao0o5UgT+zmx//nhYhYHUH6djuK/cX84Z9JnOeWnUJIb2xkH6Iq6ByRfulbAwwnbJvR1V2D0YV/8Sz5zb+2sGd/dAuGIei45IO1FawFUgJu2SnAVk4MbDhn6B2MmhTrK3eem8umQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <776F433F61C2AC4FA3E3661F1005AFB3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dffba29-7cba-4ca6-261a-08d84ea46879
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 18:25:30.5359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+WxNTK+wSDO9rlqg2/9hvKSFgj7+++WDoteJcyDj5dWSPIpmoJrHYuMCuUI4KCaWZV7CCPmAJqkNG0+BnxdWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3684
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/1/20 4:36 AM, Stephen Rothwell wrote:
> Hi Mike,
>
> On Tue, 1 Sep 2020 12:13:08 +0300 Mike Rapoport <rppt@linux.ibm.com> wrot=
e:
>> On Tue, Sep 01, 2020 at 06:49:28PM +1000, Stephen Rothwell wrote:
>>> In commit
>>>
>>>   7000c9462d1b ("arc: fix memory initialization for systems with two me=
mory banks")
>>>
>>> Fixes tag
>>>
>>>   Fixes: 51930df5801e ("mm: free_area_init: allow defining max_zone_pfn=
 in descend ing order") =20
>> It's line rewrapping:                                                   =
            ^
> Yeah, wrapped and then unwrapped with an extra space :-(

Its vim's doing. Now fixed and pushed !

Thx,
-Vineet
