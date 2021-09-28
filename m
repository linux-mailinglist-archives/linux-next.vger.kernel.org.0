Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC92441A665
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 06:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhI1EUs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 00:20:48 -0400
Received: from mail-eopbgr110091.outbound.protection.outlook.com ([40.107.11.91]:36328
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229493AbhI1EUe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Sep 2021 00:20:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1X7esnk4MPBJZtpVjlNqm/Ft+H05msYYTXUY/eCyMo5qtprsvH7KwXNQ0Xs2biS4zNTJqVON/COu0es7V0TeSpBI7lLMqjgbsehxp4e5mPd2PFA2qYMkkF56RRQaJmCaZH6fZsmkC3pjkQ/BSVYOoWZXBcgh3YaDGdb0c3PMQ+U4WTomVLgp7nkYWmdYhoIlXVfRwMuJQ+TyxJP2TkCSJKSip+POM2vAaTNgxxSeWL6hSfV7QzS5m+f+FlLkWs63SlqWD9eqyUFJ7xECbiJT7d9e1KAfRiInvyWC1hLvXwHnG3Z1BkXPjSCe95RsbXC1+K4COEF3SeiY/f6JPL+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4p8+Q06LZBQlhBgGTI1YsUvbg7lgzKHdqd7MwvtOdeM=;
 b=dYDRncT7ptpWaXxOURtLviSSjaaZXE3UsCq/6nlp/hqNxX2UZE/NkGLk9EWET8q9oLfr23ut9OBE9hSYr7lKP22PRrDOGnih5ou3P8KmKF8dQzgYWKbX1krDwgWJy9xZqFISHCRS3yiPhaMX64QNabdv+sS4P7NrFyhLLDGIi0hFEqALa7C9XZmePGUKjB0v1w2HhQ85zOnbzUya1j0GHrTEfah7M1Vl2DGHLOwA8e8jfPGwGF59tRQCGNAGxpMx+BHRaaSOfrGUtZgi91gDVHi1gE+IPdHm0lPhDLgUQiBRN1IxiiH5TC2iSkVSLL5fidUJmVedWYyW6Cq+RQKleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p8+Q06LZBQlhBgGTI1YsUvbg7lgzKHdqd7MwvtOdeM=;
 b=n9RGVWziMQ4hOjw+4wdrqNOMaj2BWjBZDVeCzu0QfqLmB5olNiLpZkR9hbIlVTd5wd4G7yRTHBYr1g30EJg4CKVlKmTAmXdeZiOzvBwafvhuB7Qo2YEqB486M0qh3hQYsV6QhO27QptrRLsA2jGteo/01ap0r+mgZusl9FnRHwA=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB5134.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 04:18:53 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f5d5:4a38:620:62e5]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f5d5:4a38:620:62e5%6]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 04:18:53 +0000
Date:   Tue, 28 Sep 2021 05:18:49 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20210928051849.00000e99@garyguo.net>
In-Reply-To: <20210928140932.41432dff@canb.auug.org.au>
References: <20210928140932.41432dff@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
Received: from localhost (2001:470:6972:501:b09b:32b0:ac13:e1e5) by LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:195::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 04:18:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de7af5f-ed70-442c-4af7-08d982371485
X-MS-TrafficTypeDiagnostic: LO2P265MB5134:
X-Microsoft-Antispam-PRVS: <LO2P265MB513463D7EE20A499B7E8C7F0D6A89@LO2P265MB5134.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmNBWMOgqNX91jV29BY2ABPwZevzqntVrPkigQN+5xawWkj+SX8lLPRcd3fT5K9OJXYunuq7VtH9MA0OS5WiFKIzEwd02W3Etlm9nEY0Eq40O8lYmDamCWPhTkFeuqZMvEPQiMDDVtbjSIL8OFypEAYc8bH9FIdkZ5MnmCQMln6Edem887kg5Q6mTCpwdUVx0rcwZs5LJY2eM4zBvNTL2TAWHIJlk/Rep7a9T/MkkIxFyNrVnc3TAGHBPDZLXT5Pt65Ote7TrMrW6S0fDTsTEN0VJ3OgtSiNxaqfELViQVCAQt8hWT4ZGAXg9HoOMbasBRVxlgfq2+AbfoZtB8VDXWPm8pkXC3XZvKQAGmqY4JrGBk85aUasAHV2N8PWmmBq/j+ukGr0IwRs6yS4wwWKycI1TAY9PRewTmohTovpIEG7dQc4tVBcFXyRn5hQwnTKAGZJQrkLrrFNCwhqaMGQBoQ8/jL42fVi9cvl0mBVsIfNz7yYeELWxT8cTSwTMgcCEe3/Y3xIoK/Ekjgt6g+XRWM9L1uBmMuOs8e3RiL6GAR/PlTpwxcoCkH78kAL/bUL4Z3OZzKyrQ63/0dglI3Lje3lYz0VyzrCV4h9/xsXcnKJNS7Gw1wqymftf6fArKMnqjC7l5ebOkX1LgYUFNCK+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(39830400003)(366004)(396003)(376002)(136003)(83380400001)(6496006)(6666004)(6916009)(508600001)(66946007)(86362001)(66476007)(66556008)(7416002)(52116002)(2906002)(53546011)(8936002)(54906003)(5660300002)(36756003)(1076003)(316002)(6486002)(2616005)(4326008)(38100700002)(8676002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c2Pc3N64T5UOj8f03GYXYVLjOx+k51yIHwJ2QPvGsnu5bMU24hDgIiA0pb23?=
 =?us-ascii?Q?nh6eQGcBoJaJt1jOkv2FxDRYem0NlvfwZ30PVk39IRsQZnG0zZ2QReBuyu9E?=
 =?us-ascii?Q?uILX5D7OMKKRVsqEB+YAym6ZALRgxvFs5ZD5gJySqX6a/kwauYzVNDr6CkTm?=
 =?us-ascii?Q?23AHIU5k+oYgQlQARBzX5/BUd6rrM09H6ropvFURxnMKpounQOnBsaGFyzKl?=
 =?us-ascii?Q?vDZ4UcFO4buhj0cM67ZTuPU/Cj4J/bZ0HXmT0if4K1CW6xxHdX/nsWHUPJ44?=
 =?us-ascii?Q?5xUWkZTpy0vrVFTb/feqdW8XYla66btVrcEc8+g1BL4ZqIr07/1fF71ev+K/?=
 =?us-ascii?Q?vDBh6Fj5ODS02Zi51U92COKNE4wYPHRnBiZM9vIyInO/CFXE/5zYO12ifWCO?=
 =?us-ascii?Q?a8iA3egh9GPYDhXteQ9INf/qMRA56r+GjFYTbbzXvD67Vjovf4U/l+xj9Pcb?=
 =?us-ascii?Q?PXHs1a8msvRya6wwpDNWNW9GA4bU/qjsgVSjgukZ+UqWVZShSKzJELAog5ea?=
 =?us-ascii?Q?BegydGY1OZU0RbyQfBhVH54kKgpUboAUEDAKfiD3c5dKFX9yuNze1sL86BW4?=
 =?us-ascii?Q?Dl6g+eDledpPfij/PipkjcTXQhDeu0/z+jnIPKR2f8jMj0hY0wsaIAX31w/h?=
 =?us-ascii?Q?Epj2Qo66ubGxq1Q9kl8QPlA2m1eYiQA2Y4HwptGEeNQDpaOTZJLuXu+g+G4y?=
 =?us-ascii?Q?NT1fHRrsuzUpx0Rhyv4AoI7ZtB3+trfFbzRt54nLyZjg4k1f+xR4JcDwb+kp?=
 =?us-ascii?Q?dQ/8tgK/GsGzNliC6rm0OCfAJHgQfFezG2zFddkDjKrjQY1OqJlj0Y5YbqIs?=
 =?us-ascii?Q?I3Rj/UQdez+6YE2kGn43YD3oJhABE9TOhRbd+o0PFdfS0mKe6o2YtHCXp1lD?=
 =?us-ascii?Q?n0gdviktqwsGVHQZXsp4cvDDxi0x7f1qwYeepsA9AemS+o3EIRNlAkxMxljK?=
 =?us-ascii?Q?tfyr1MrqLcBiw+pUO6DesBQ5+mFI0zarbciV50wXTDVezOMRlV07I0fyrJ6a?=
 =?us-ascii?Q?YqaeKDGdkJ3D8KpKurwErL0hOPXudt6Vn2bivthP9xEHOuOeWEJ+S5uzFijj?=
 =?us-ascii?Q?TFksP6OqUkQKdVfdRIfpw63mdVuw322XL6TuTwfJCFo2C5C8cr1IlUK4KPRC?=
 =?us-ascii?Q?BHpjYdHbJB/S3hMdHMo+VkcpWrQkF3SIRSwkKnRbTbWSK3HeE7XfQvJaDZzI?=
 =?us-ascii?Q?W/g8nfD6CnESdFk4bXUwIF6i4H3FVfn5AOJmYVFgGxioBWO1dQV8V7vQX6Sk?=
 =?us-ascii?Q?52n2oZOd2lZsPjc1QNgoF/dC5YdkfTWkkOwBzI3ZqUUHoDWLdUfOaCkpUSpW?=
 =?us-ascii?Q?+dapHHRwwx2fq4BOGelfv5Rt7+T2ZCgg0J7NSIm++hpkm+vdgsh4HV6JHEvv?=
 =?us-ascii?Q?lDYVV4HsESYQLN/bDvmUOvhmGqrB?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de7af5f-ed70-442c-4af7-08d982371485
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 04:18:53.0151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BenZq/w8RNNO+48qsVzc/P1fm81EWMzNW+RcNgpIcUf8Ls6MXz+Sow8QNotIwv634KPIWc6/eLV7/rEDb1oBCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5134
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 28 Sep 2021 14:09:32 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the rust tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> scripts/kconfig/confdata.c: In function 'rustc_cfg_print_symbol':
> scripts/kconfig/confdata.c:669:9: warning: implicit declaration of
> function 'sym_escape_string_value'; did you mean
> 'sym_set_string_value'? [-Wimplicit-function-declaration] 669 |   str
> = sym_escape_string_value(value); |         ^~~~~~~~~~~~~~~~~~~~~~~ |
>         sym_set_string_value scripts/kconfig/confdata.c:669:7:
> warning: assignment to 'const char *' from 'int' makes pointer from
> integer without a cast [-Wint-conversion] 669 |   str =
> sym_escape_string_value(value); |       ^ /usr/bin/ld:
> scripts/kconfig/confdata.o: in function `rustc_cfg_print_symbol':
> confdata.c:(.text+0x738): undefined reference to
> `sym_escape_string_value'
> 
> Caused by commit
> 
>   dc08d49444e9 ("Kbuild: add Rust support")
> 
> interacting with commit
> 
>   420a2bdbead2 ("kconfig: Refactor sym_escape_string_value")
> 
> from the kbuild tree.
> 
> I applied the following patch, but it doesn't seem quite right.

That's indeed incorrect, if we have `CONFIG_FOO=bar` then sym here is
`FOO` and value is `bar`. I think to resolve the conflict, 420a2bdbead2
would have to be reverted.

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 28 Sep 2021 14:02:54 +1000
> Subject: [PATCH] fixup for "kconfig: Refactor sym_escape_string_value"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  scripts/kconfig/confdata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index e1a739897d5a..096222531954 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -666,7 +666,7 @@ static void rustc_cfg_print_symbol(FILE *fp,
> struct symbol *sym, const char *val case S_HEX:
>  	case S_BOOLEAN:
>  	case S_TRISTATE:
> -		str = sym_escape_string_value(value);
> +		str = sym_escape_string(sym);
>  
>  		/*
>  		 * We don't care about disabled ones, i.e. no need
> for

