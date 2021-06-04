Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E314E39B7AD
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 13:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhFDLOZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 07:14:25 -0400
Received: from mail-eopbgr1320091.outbound.protection.outlook.com ([40.107.132.91]:54301
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230075AbhFDLOZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Jun 2021 07:14:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQmYBVh6fyFk2Cqy3nokAubKzpe5r8VdTHwn2Ke6Bef0Kq54O8nYLxsEPkNlwGfQXUJVHW1svURKfVOMPjpQJXYu8kjltQ38LhU0zOr57Q1CM3Spz33RW3VohJPFB3rIhXaPPkLYhYf58u1dvbqGpXc+IkiybrIB/pGmRc0ogp6JOPQiW9pxvMgnqGE+8MPjq++QWJ7rQ4FE0FYKmALKiheY1vHcVXkEBN2KfB0ljpAwSfIUIaIT9K/Zes+VxUbvN8l5It992X2IVSiiIjf3e6iS9I1s7FcYNUcdaKH9XeYal4z4lk52jHriXMeTjFfMUQmbgISLSJp4kEhhiRrcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4Iboytt+Z07ARqwu1Oamw4A80heik1ZgzwbQoBoNXs=;
 b=UJXw4SJEdpPSHIUmyYf++/CqkvBoPd4CdhJ5dpiFM9GFyrCvexouh9Dm3yU4B8iRP/0zvWLDRbDqbaFPXa2WIrJ+XNGWXVY8PAY9atDKiYw3AXMvq3meiRz/GWsMFuHtZZ81j/DM1MWh200ZMVhz0kjxtetwZeTGzS5C/Qf9m8tAOSlON9bPfWEhAF7ker7AsGzupmLMlZ/9gcRG1WIynHezqr2tfNHjcyBfcQ/JLWv8/zkn5nZWTHuzW2STDO0JmSy6VOfdPmiipldkT0GvepoHb8dFVf0Hh4840101ZUTXsUh4Cdpt9O0piVzSobpx0JnDJHc3a1btw4otexUr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4Iboytt+Z07ARqwu1Oamw4A80heik1ZgzwbQoBoNXs=;
 b=FrZOZ9efFTRyB8crk82I5U+puVDKK2XIInOvYaGqKxgJx8Faw8y+kEFroRNA/GPpqlphCbq9QCQVJ1puDoCEmW2MgWVmXEgsXhScgiXEnc25cQfIprZNDvf9fXGTAKkICCDD9Ci2JsHZ/skwXL2FOd+tZ0DY37lBSU4h9sAjFhg=
Received: from KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM (2603:1096:820:17::13)
 by KL1P15301MB0021.APCP153.PROD.OUTLOOK.COM (2603:1096:802:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.3; Fri, 4 Jun
 2021 11:12:33 +0000
Received: from KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM
 ([fe80::dce2:ae54:47c7:ab19]) by KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM
 ([fe80::dce2:ae54:47c7:ab19%8]) with mapi id 15.20.4219.013; Fri, 4 Jun 2021
 11:12:33 +0000
From:   Shyam Prasad <Shyam.Prasad@microsoft.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Steve French <sfrench@samba.org>,
        "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: RE: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect and
 chan_index to "unsigned long"
Thread-Topic: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect
 and chan_index to "unsigned long"
Thread-Index: AQHXWS1tP+VZPWMXi0u3vseeftCydqsDqcIQgAAH/4CAAACcMA==
Date:   Fri, 4 Jun 2021 11:12:33 +0000
Message-ID: <KL1P15301MB034321F9FA32CA3A5BBE7AE9943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
References: <20210604090219.385504-1-geert@linux-m68k.org>
 <KL1P15301MB0343B4F6AF86864149DFB231943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
 <CAMuHMdUyNuqOTHKLkO8=mWsbFJer7C0sOmswAiANSJnoDWbRTw@mail.gmail.com>
In-Reply-To: <CAMuHMdUyNuqOTHKLkO8=mWsbFJer7C0sOmswAiANSJnoDWbRTw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=795b5df1-2d74-40df-87d0-3d0edfc1965f;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-06-04T11:11:25Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [2404:f801:8028:3:60f4:ca47:5dfc:b1d0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dc0f209-c726-40ca-8598-08d92749a706
x-ms-traffictypediagnostic: KL1P15301MB0021:
x-microsoft-antispam-prvs: <KL1P15301MB0021EF478CEF7ABDBE31EDE6943B9@KL1P15301MB0021.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64lGRW/8elfB4s5Iiul96oXmQFdPwVM4EfgtjzvgJuvyL+nygmupi7z04moo7Wn1pobvYeKVHW0PkiKL+wgU5AIiql6M0jL12oQqSPj1fe5xQsjC9HrOkE4bFmm4CC0XxXjs9YeG0Tjxxa9Xz+JvzOFyu1uW0E3HZ18gUnUXg5wMFOM21fDR3FJz0YrnAzb+V+dkPQLxBGi7bY3mWhTqe/DfCphtz7DkUWsvVA4v9lKt9YSUxMhQJlZbdbLymY7zsegIUvr02lD7ngleidBezwepCVecKvSzoCaTtZf0T5bTGTxjN5FdXc0T9tQK1ZpKtDaVI59r1tMxNl+V2EjmVHIGX+32ma6jgaz/ak4smZ1ftKGyyZcia5BzWdRcUVM6cRWxSH0dOqipA84U87o/HLKQ1rtdikg7ANDRpamybsDhckocT8Bir50GRyZ0v5ssrvsIG6yyrdFClNOw7qjZPqYKW8BeADCq8vuDPVN7hlyqxY5m58ik+dynLFAESOxvvWg7/HtENN8Re5MzevcYIkibwrUjIMPHkNPswH0VDbMSCDRKDWIbL3KyhxZuiAo76VS5E40Cja3Yro+iUJ8qGEhQhdurJyD/J1NedZGhBdOcjIJk9jieSzBeCo6KCQ01h+zrA4qol0+8k2LR2VMFVFh08Wn3i4ERTF1KJV25lq9u+7++AkVaV556mMQW0gnoTXYJ7WTBUIw1Vrx3IfmqVD+WW2XKvfggtia9xdGKDAJTGo4Ml9I/hxQppGremouCLPZ3/i7UsAxZsrnruy8mBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(52536014)(54906003)(8936002)(316002)(82950400001)(82960400001)(2906002)(186003)(76116006)(71200400001)(64756008)(53546011)(122000001)(33656002)(55016002)(83380400001)(66476007)(66556008)(66946007)(9686003)(8676002)(86362001)(6506007)(66446008)(5660300002)(6916009)(4326008)(8990500004)(38100700002)(10290500003)(966005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nTWJOYAF2ENvz/4ghM86BNXI/e23Abk8gMNHI+P4bB7KL2RS8Wvu6LnN+jDZ?=
 =?us-ascii?Q?Qk2dNUnpXtygEYa4tp42d1dp6Nt/NbnFUF3zsdSXWndKRQPxXRm+HTrzaGyq?=
 =?us-ascii?Q?zaWFnbm+HyR5P4hFcZFCT6t70PZa2AkcvO9vEVc9IqtxB1MiqremLB1t+gk7?=
 =?us-ascii?Q?QCE/+Ss8IjP0Au79wH0G/7DYb/zm+hfm9xR0nW3qTyjQxyHD9VOLOIvLkb4e?=
 =?us-ascii?Q?D4Kk6qL485uutmzIgBSruMKPBAebNSOXJgHrOPipdfSTu/2Y59QRhgnYvQ9b?=
 =?us-ascii?Q?1O9szJOhWu44UiHf22KUIsfx6GjzRzLp/rM5BBxz8VKv7kz93zXwYciS48S8?=
 =?us-ascii?Q?SsL8jjPhDvt+3EPhQLD0wXQ2ntVNG79SffXDixafpnmqGI6vja5qTln4uPvd?=
 =?us-ascii?Q?+sFXyDN8hC/1wnzsOsn9NoFo2aFZkDJaSCeq7scEZztkoYgPXZTa8vCBEwod?=
 =?us-ascii?Q?QSifGhaov1JERMxY2N5+Bs52/Pa/Xm3CwIGSewG5hut5xKkYXwaVpamqDttA?=
 =?us-ascii?Q?CkOKXAGBPuYEz8pu1gpEab5vdml1uo/h6+vnya7SkThmUxE3V9Gvr+JwsixI?=
 =?us-ascii?Q?X6enINNSGT5gdNAwY9GOaAuUEyPmJUEpT8qtLLVlHZqUK0QjH+QXlSv/KAra?=
 =?us-ascii?Q?2NCwZZsPbqes702ctR/8xgyAl+N1VkCXnFJDan3G4qKJH7vIRiL7D4mTj6Br?=
 =?us-ascii?Q?tL3OUPIDKuUajdDJYcl26M9UuMYofHPgqtuk/JqE8ND0QUSKIM21DoGeD00e?=
 =?us-ascii?Q?rwOPA3W+DuBUNaI44INlZcxKiebzfRuAUUjzpAGnbaSMkNiSQDH/oMAOtKWX?=
 =?us-ascii?Q?ycdBAgxigrgYLUBPPvlnWpZcPpJ6hM7Jnvd6s9tUhzkg+XbesyJ7g1twIzEc?=
 =?us-ascii?Q?0chbE17gvUMR1WKZ9uhID2sI5m+Pvj6gcxTVCoVnhSv/DpCB1VCiN2k5SAyP?=
 =?us-ascii?Q?TNSsnW2P5D0ngJyMj4P3kdWsglVL/mP4nSQmIvPko0WC2QqSZqdrqbdhRTVM?=
 =?us-ascii?Q?BXnaqvMcJvrt7eJOGNsmqaE/rtptLqKAa4suctDTsKwg6q7h/9bdaMkhvOgd?=
 =?us-ascii?Q?lzYV6aFaHTP945Ffu18V1kRgv5bXkfSK9/NNShjnf/bMWlOBcEPV7ojVmyjx?=
 =?us-ascii?Q?dhhG8i80FoYdBxyyyi8f7I4acPs5ZjffG5UBTVMmA7mOl0ODiIK1JFHv8yw9?=
 =?us-ascii?Q?5srjcs8p0Y71xRSPT60hHMLuSL2bpFMM2GYJ6mlYn8kJIOqJ6QLvVrT6qg3i?=
 =?us-ascii?Q?z8EgZYhjAGx4vCpN3Vq8xoHC9FaasUDt1gbOCMYbpydEUsgi2A64YbIHISjQ?=
 =?us-ascii?Q?iYSFjTosm8VoXejZioWytgVM+WThXn3V1xK4FoY4d05fhMSXllITot2C3caq?=
 =?us-ascii?Q?N5wWs6k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc0f209-c726-40ca-8598-08d92749a706
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 11:12:33.5645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZaMNHxRVGde0vEF43eMDX3f7j8oy4TZTzlUZdpq25Bj0TGntQv+8d/NdBg0bx6Ib8kUSkvoiAtUZxzgueNtiDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0021
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Geert,

You can find the updated patches in the linux-cifs mailing list about an ho=
ur ago.
Titled: Multichannel patches

-----Original Message-----
From: Geert Uytterhoeven <geert@linux-m68k.org>=20
Sent: Friday, June 4, 2021 4:39 PM
To: Shyam Prasad <Shyam.Prasad@microsoft.com>
Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org; linux-nex=
t@vger.kernel.org; linux-kernel@vger.kernel.org; Stephen Rothwell <sfr@canb=
.auug.org.au>
Subject: Re: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect =
and chan_index to "unsigned long"

Hi Shyam,

On Fri, Jun 4, 2021 at 12:41 PM Shyam Prasad <Shyam.Prasad@microsoft.com> w=
rote:
> Thanks for the email.
> I've already submitted the fix for this. You should see this fixed tomorr=
ow.

Where can I find these submitted fixes?

As per linux-next policy[1], commits in linux-next should be posted to the =
relevant mailing list first, which is linux-cifs, AFAIK.

Thanks!

[1] https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.kernel.org%2Flinux-next%2F20210430174733.5a31d0c6%40canb.auug.org.au%2F&a=
mp;data=3D04%7C01%7CShyam.Prasad%40microsoft.com%7C50e24fa9469045cee62208d9=
274937e2%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637584017711363338%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DWVfbz5WhzyupDUljqSmxlyCdSZtOPcdGxwYpoyqYXq=
A%3D&amp;reserved=3D0

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Friday, June 4, 2021 2:32 PM
> To: Steve French <sfrench@samba.org>; Shyam Prasad=20
> <Shyam.Prasad@microsoft.com>
> Cc: linux-cifs@vger.kernel.org; linux-next@vger.kernel.org;=20
> linux-kernel@vger.kernel.org
> Subject: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect an=
d chan_index to "unsigned long"
>
> On 32-bit (e.g. m68k):
>
>     fs/cifs/cifssmb.c: In function 'cifs_reconnect_tcon':
>     ./include/linux/kern_levels.h:5:18: warning: format '%lx' expects arg=
ument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'u=
nsigned int'} [-Wformat=3D]
>     fs/cifs/cifssmb.c:201:42: note: format string is defined here
>       201 |  cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %=
d",
>           |                                        ~~^
>           |                                          |
>           |                                          long unsigned int
>           |                                        %x
>
>     fs/cifs/transport.c: In function 'cifs_pick_channel':
>     fs/cifs/cifsglob.h:955:20: error: passing argument 2 of 'test_bit' fr=
om incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>       955 |  test_bit((index), &(ses)->chans_need_reconnect)
>           |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                    |
>           |                    size_t * {aka unsigned int *}
>     ./arch/m68k/include/asm/bitops.h:151:66: note: expected 'const volati=
le long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned i=
nt *'}
>       151 | static inline int test_bit(int nr, const volatile unsigned lo=
ng *vaddr)
>           |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~^~~~~
>
>     fs/cifs/sess.c: In function 'cifs_chan_set_need_reconnect':
>     fs/cifs/sess.c:98:22: error: passing argument 2 of 'bset_mem_set_bit'=
 from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
>           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                      |
>           |                      size_t * {aka unsigned int *}
>     ./arch/m68k/include/asm/bitops.h:41:69: note: expected 'volatile long=
 unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
>        41 | static inline void bset_mem_set_bit(int nr, volatile unsigned=
 long *vaddr)
>           |                                             ~~~~~~~~~~~~~~~~~=
~~~~~~~^~~~~
>     fs/cifs/sess.c:98:22: error: passing argument 2 of 'bfset_mem_set_bit=
' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
>           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                      |
>           |                      size_t * {aka unsigned int *}
>     ./arch/m68k/include/asm/bitops.h:50:70: note: expected 'volatile long=
 unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
>        50 | static inline void bfset_mem_set_bit(int nr, volatile unsigne=
d long *vaddr)
>           |                                              ~~~~~~~~~~~~~~~~=
~~~~~~~~^~~~~
>
>    [...]
>
> As bitops can only operate on long objects, and
> cifs_ses_get_chan_index() already returns "unsigned long", fix this by ch=
anging cifs_ses.chans_need_reconnect and chan_index from "size_t" to "unsig=
ned long".
>
> Fixes: 374c6c7bba3cbaa1 ("cifs: changes to support multichannel during=20
> channel reconnect")
> Reported-by: noreply@ellerman.id.au
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Can you please add Link: headers when committing patches?
> I could not find this patch in the lore archives of linux-cifs or linux-f=
sdevel, presumably it was posted elsewhere?
> Thanks!
> ---
>  fs/cifs/cifsglob.h | 2 +-
>  fs/cifs/sess.c     | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h index=20
> 8fea2ddd2bd7af26..a9c026af21e1e9d1 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -968,7 +968,7 @@ struct cifs_ses {
>          * enable the sessions on top to continue to live till any
>          * of the channels below are active.
>          */
> -       size_t chans_need_reconnect;
> +       unsigned long chans_need_reconnect;
>  };
>
>  static inline bool
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c index=20
> 1721a3b246942266..1a17ddd6abbe5778 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -94,7 +94,7 @@ void
>  cifs_chan_set_need_reconnect(struct cifs_ses *ses,
>                              struct TCP_Server_Info *server)  {
> -       size_t chan_index =3D cifs_ses_get_chan_index(ses, server);
> +       unsigned long chan_index =3D cifs_ses_get_chan_index(ses,=20
> + server);
>         set_bit(chan_index, &ses->chans_need_reconnect);
>         cifs_dbg(FYI, "Set reconnect bitmask for chan %lu; now 0x%lx\n",
>                  chan_index, ses->chans_need_reconnect); @@ -104,7 +104,7=
 @@ void  cifs_chan_clear_need_reconnect(struct cifs_ses *ses,
>                                struct TCP_Server_Info *server)  {
> -       size_t chan_index =3D cifs_ses_get_chan_index(ses, server);
> +       unsigned long chan_index =3D cifs_ses_get_chan_index(ses,=20
> + server);
>         clear_bit(chan_index, &ses->chans_need_reconnect);
>         cifs_dbg(FYI, "Cleared reconnect bitmask for chan %lu; now 0x%lx\=
n",
>                  chan_index, ses->chans_need_reconnect); @@ -114,7 +114,7=
 @@ bool  cifs_chan_needs_reconnect(struct cifs_ses *ses,
>                             struct TCP_Server_Info *server)  {
> -       size_t chan_index =3D cifs_ses_get_chan_index(ses, server);
> +       unsigned long chan_index =3D cifs_ses_get_chan_index(ses,=20
> + server);
>         return CIFS_CHAN_NEEDS_RECONNECT(ses, chan_index);  }

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t when I'm talking to journalists I just say "programmer" or something like=
 that.
                                -- Linus Torvalds
