Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF9539B83F
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 13:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFDLuq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 07:50:46 -0400
Received: from mail-eopbgr1300109.outbound.protection.outlook.com ([40.107.130.109]:37879
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229682AbhFDLuq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Jun 2021 07:50:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htUsipYRnGGT7K6RWeE2pClDHfT8wn+10mLXOmFsRUUDmgVc+Wo7e5PGRSyiSatuHcJSYIyst1Wga9MBqDysJNsZniYk/+/urprzfTqnKPGsaQQgB+7bv4PL7VNk/z1u4hBr5VHnAkFa4Xj40l+q1cz2R0Q+elMoAC2dALiRCWGvv3AXOSlLuhU/cFWc1n1aygp2Jvb4XqI17OEmU0bNi4PB+C2QyPjhldRGtlazhhwuAKyaRK/FAS89qewqmZ/kFF3whXz/1qCuLop7Cc8J+KrT/SlROi9zQG/w3PjwkY8Ch0ESlRax9aH0oAytG+xwL6v9EBksdlMufifCziew9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzYIEWJJkjraJBnXgeY/ET3qUXiWHgvu7hoYNqN1iOU=;
 b=KefgWiQDN8u/wROAtVxnr9+gywR9j+iMetBy1phjGuqgfEqpiVoIZ5JX1UsaCv+GwnFe8E9tJuAZiZ9SVoh1RQIQNkhR5RGB9GExPqETe2LAHGRwJ29pSKhPxNIhZJX7wH31ClxKVZE8cfAv5pMRhFSowOu+Sjst5xJhUSAT4LQUtaMHbU2PPyyNndhrtnfJ0bvQSVqxwbp+KSYwZ/E7Ky9pMNphTkdHqB9PoLwHNca2KS7/Kq30E3vOgbUj15I4eVTOgTdv3B8oJVXs1W2zAtBE823XVYhX+Xqi0Up8byB5LVOjBYgp7SgJlrdOnyM8fOqWOC1va0t5Gg/A5priLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzYIEWJJkjraJBnXgeY/ET3qUXiWHgvu7hoYNqN1iOU=;
 b=jXdWmY1bnc75vY/0XmsAtDpoh2hUTGUokGetOjtj7sF0z1ighaO+GCThQwQPiQkll29pu7rXPWxq70CQyKgxoggtpqacJx6RkZ/nzQeqLCKivEPNE89yVcNzHlFvLmbhDDJ3E3BUrwBswRr2185ly0TqPUimwaxG8JHpNCA4EV4=
Received: from KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM (52.132.242.13) by
 KL1P15301MB0070.APCP153.PROD.OUTLOOK.COM (10.170.168.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.5; Fri, 4 Jun 2021 11:48:41 +0000
Received: from KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM
 ([fe80::dce2:ae54:47c7:ab19]) by KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM
 ([fe80::dce2:ae54:47c7:ab19%8]) with mapi id 15.20.4219.013; Fri, 4 Jun 2021
 11:48:41 +0000
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
Thread-Index: AQHXWS1tP+VZPWMXi0u3vseeftCydqsDqcIQgAAH/4CAAACcMIAACKAAgAABCVA=
Date:   Fri, 4 Jun 2021 11:48:41 +0000
Message-ID: <KL1P15301MB0343008F226230DF6F34723F943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
References: <20210604090219.385504-1-geert@linux-m68k.org>
 <KL1P15301MB0343B4F6AF86864149DFB231943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
 <CAMuHMdUyNuqOTHKLkO8=mWsbFJer7C0sOmswAiANSJnoDWbRTw@mail.gmail.com>
 <KL1P15301MB034321F9FA32CA3A5BBE7AE9943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
 <CAMuHMdXJft7PJ8cnm2GV6AjQctPZzDQJ=czwmTLJcthkBiZppA@mail.gmail.com>
In-Reply-To: <CAMuHMdXJft7PJ8cnm2GV6AjQctPZzDQJ=czwmTLJcthkBiZppA@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7a93a109-be2b-4b89-99ee-83a5a6541774;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-06-04T11:46:00Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [2404:f801:8028:3:60f4:ca47:5dfc:b1d0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8eb6fbf-3afe-4652-f0f6-08d9274eb32a
x-ms-traffictypediagnostic: KL1P15301MB0070:
x-microsoft-antispam-prvs: <KL1P15301MB0070F44AAEC10A3E34F66C75943B9@KL1P15301MB0070.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4qOtKly7XDrVo/KPC/5LFvcTgYX358ud8Yl4Qygf7FvOK93vApd5YeZX16ygtcV2Q8aeHWfVizU/LohRQAMvUFE+QceO4Gml0XhctGCMd7a+9fR6FTOl4v7S6wBwDqu4V3LXRtXVsywXS8k7xok6nSEcwUAI9h87+FtHiM4UkksJhYkx5ceIvYm6XnjJ8hoWBHksnrHv1BWdD77t4FKjsKMN7jAqMx4WQ8IVQvUKQoC2tJvEzz4jDk/JnBRCxDKlKzV8ag63W5hXK9Cb4og+gm/oHDs7A1ZAFoA8vbdoS+4uT3oA0R2jJ4NSZIRUmkU71ePYsncjPf0iIkwMWZ1g914h2LC/f1sJVHmfIIE4J7OzlSoSLoFHPsc+yYIQL7Zl2fZr1mWTYp5Wfa0rAc91r5OV30z1SHmSN2bsCNgiWt6h476ZhJt6iEt/gWhz4warE8cJADRVJoPuco+eFNYARR1NGAgO6p5LhmGPcmgin5eOUcbP5jcgKikfQoUcLtk58ch4DuhhbvUSDJZA2Fb5MB00ewr4+8O5XDF+u7yAfBoKXkbWEVQ3SAjBVdnklegPzc8fq8J7qu2vIpL57FnOnCsQKxVNtS1p3rgzpwDR85QfO1TfA0UVrYHWO10CbpXw0MMkIdxqGCQDdNzLlS8SWhhJBoYAIqmeiEpA0QAZe0Z4q9dZlhfIxhYk4JRwwT9k9NX1MVrhf6vrudl1db0aGdf9myufXBgNtwVrr6oETc80tUzD4ZvUQY/tuebdeyrzjQ3+hLhJ6zI2t+hMZQFh76DVhEA4NTyq4oy12QkNNif7gii6aEB5JU1hjbkZsyf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(478600001)(82960400001)(82950400001)(52536014)(55016002)(7696005)(38100700002)(9686003)(316002)(83380400001)(122000001)(8936002)(6506007)(53546011)(86362001)(186003)(5660300002)(8676002)(33656002)(10290500003)(6916009)(66476007)(66446008)(76116006)(66556008)(966005)(2906002)(64756008)(54906003)(8990500004)(4326008)(66946007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Lvhc88XOJni9nHWlX9pGjEMBlkzVdNko2TN0SAMpPQydIcbap02klV2Fqh66?=
 =?us-ascii?Q?zJHFvP3mnYWFQvWQPhDkTwmLVLrtfsPz7P82NLymWJ+TAfOMkxHROUN0CRIH?=
 =?us-ascii?Q?NmyJjYBtRxBqyiOH0+CJnewN9ZYS+j1JgiBqApVEPXRVVeKayzzGMp38qiMt?=
 =?us-ascii?Q?Ys8id/+iqBjxsb2vuzdkXt3rirThXXoff9Kh8zgCsSLezWlzLHGB51CsC4CD?=
 =?us-ascii?Q?tPl+f00nsjo06vgqoFnULDPXn18Sdhmm4QOnPMZ1GMlBGJxJSaEua3Fst1Jg?=
 =?us-ascii?Q?L1aUcSJLP0YMsc0yva9dqW2fqH5oKkCn0fuP76jv8DoRFvrY2aitt+FVsvC7?=
 =?us-ascii?Q?1vbyCPfyr+rhFv4I8mc4WuN9snC43qBdED3LLY6EJWuYO/oJZ3zoknULwKzl?=
 =?us-ascii?Q?IaprU0tEIfo70eb9eoerzthnnqfEd70otuaHRjAXANhhOXSlwkXpajQ21i3f?=
 =?us-ascii?Q?sZCULRqme53lts2A1/JAuaX1XfzVVU2VwSDBbCt9NDpi3XMv/bIaXW85QNOM?=
 =?us-ascii?Q?lnwklQ/XK2mBhK1Ke8ptbIMnKfdTyDXZ5K2m2IutJ3nqTrR5l9am876pFFGY?=
 =?us-ascii?Q?T8zxQ0JmE+wIZmnm6VmWbK7BGjGm9mUheEB0WcvOBWUjmgstpf5yfZu5Ny4j?=
 =?us-ascii?Q?NirzU3ow7hTqJ+odfu9/jxhO5Cg5Ikl1+raiRx8xtMoxYJdB+DBOtSl/Y1rM?=
 =?us-ascii?Q?Xp7GfOb7slrwucJf5Wl1u7pjrALmQYn+wIYEzVgVanMChOGpwOOBR0mupG/V?=
 =?us-ascii?Q?iWBc8UJ/9b4G7xFzDlaYXGxmCgw9VkWzXl8M2862EbxhlSF+JgQa18ed2q0b?=
 =?us-ascii?Q?wMGIziKJ8T9cDJTeUJ5ewWUg5R4Xb91KxfR6voHRypF9Fy9ZuJVkEbEIqcCP?=
 =?us-ascii?Q?cQ6uUTMXXf4JzadBHJHKwkG0DATMT6R9jFmahVYWK6pX7+TxiwlcGRu66wJP?=
 =?us-ascii?Q?eD0Mmbjklj73itP1EYiLlOfmhYwiCJ9bzChSVbxDa9u40HCjV5QAck7smeQD?=
 =?us-ascii?Q?UsTlnvUuYxvurC4mOpovr+/YAAKQBNVqgkUQNOwSE4LwEdbt8WmisF+qCBMe?=
 =?us-ascii?Q?EQz0TQysi7BlbVMl0v98xtIF9Poq4ly40jNOFIYqSzL0Slj8LCOJ493kxerO?=
 =?us-ascii?Q?8CJoQSgLOsxI6HSRaLifSJnNKrOIx82dVBDbwS8qBH4/pr7zy7UMRzlH0cTU?=
 =?us-ascii?Q?Gp5yOb81XoCJ+fct0MIsJemz3oLinsCNiq9UVCEZ55aJXhPTqEkWnVe/sBB6?=
 =?us-ascii?Q?BUJbiwG3P6PyYN2oyfj5IgiTgJqd/vZuPw2RzAGK2We+lHT5gDvWgCp0Uhzn?=
 =?us-ascii?Q?dbo7zSG/ZSL9SAI3PBVfFZ2iUru4J29ROaIxopo7664QvIqwyd2GBnwvEapZ?=
 =?us-ascii?Q?6VtYXAk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eb6fbf-3afe-4652-f0f6-08d9274eb32a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 11:48:41.3375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6vGIqg8EfM9XL290do8YAJw+5J/QPPKHfffoXF0fyNq2q8msi4fa6uE/y58JUHn/Sz6Vx2/rppcmJ7Q/kpstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0070
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Are you referring to this PR?
https://github.com/sprasad-microsoft/smb-kernel-client/pull/5

https://github.com/sprasad-microsoft/smb-kernel-client/commit/09d387ff8f064=
f4d1e7e8d15b248742bac9e12aa.patch
This patch is now using chans_need_reconnect as unsigned long instead of si=
ze_t
+	/*
+	 * chans_need_reconnect is a bitmap indicating which of the channels
+	 * under this smb session needs to be reconnected.
+	 * If not multichannel session, only one bit will be used.
+	 */
+	unsigned long chans_need_reconnect;

-----Original Message-----
From: Geert Uytterhoeven <geert@linux-m68k.org>=20
Sent: Friday, June 4, 2021 5:12 PM
To: Shyam Prasad <Shyam.Prasad@microsoft.com>
Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org; linux-nex=
t@vger.kernel.org; linux-kernel@vger.kernel.org; Stephen Rothwell <sfr@canb=
.auug.org.au>
Subject: Re: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect =
and chan_index to "unsigned long"

Hi Shyam,

On Fri, Jun 4, 2021 at 1:12 PM Shyam Prasad <Shyam.Prasad@microsoft.com> wr=
ote:
> You can find the updated patches in the linux-cifs mailing list about an =
hour ago.
> Titled: Multichannel patches

The link in the updated PR still points to the old buggy patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Friday, June 4, 2021 4:39 PM
> To: Shyam Prasad <Shyam.Prasad@microsoft.com>
> Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org;=20
> linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Stephen=20
> Rothwell <sfr@canb.auug.org.au>
> Subject: Re: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnec=
t and chan_index to "unsigned long"
>
> Hi Shyam,
>
> On Fri, Jun 4, 2021 at 12:41 PM Shyam Prasad <Shyam.Prasad@microsoft.com>=
 wrote:
> > Thanks for the email.
> > I've already submitted the fix for this. You should see this fixed tomo=
rrow.
>
> Where can I find these submitted fixes?
>
> As per linux-next policy[1], commits in linux-next should be posted to th=
e relevant mailing list first, which is linux-cifs, AFAIK.
>
> Thanks!
>
> [1]=20
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> .kernel.org%2Flinux-next%2F20210430174733.5a31d0c6%40canb.auug.org.au%
> 2F&amp;data=3D04%7C01%7CShyam.Prasad%40microsoft.com%7Cf7e7a8acfce742a86
> 13d08d9274dd650%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637584037
> 569130123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DKtltZkg52K1iI84809CQTx
> kIN4OxmoxhRDZ%2B%2BW4hu00%3D&amp;reserved=3D0
>
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Friday, June 4, 2021 2:32 PM
> > To: Steve French <sfrench@samba.org>; Shyam Prasad=20
> > <Shyam.Prasad@microsoft.com>
> > Cc: linux-cifs@vger.kernel.org; linux-next@vger.kernel.org;=20
> > linux-kernel@vger.kernel.org
> > Subject: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect =
and chan_index to "unsigned long"
> >
> > On 32-bit (e.g. m68k):
> >
> >     fs/cifs/cifssmb.c: In function 'cifs_reconnect_tcon':
> >     ./include/linux/kern_levels.h:5:18: warning: format '%lx' expects a=
rgument of type 'long unsigned int', but argument 2 has type 'size_t' {aka =
'unsigned int'} [-Wformat=3D]
> >     fs/cifs/cifssmb.c:201:42: note: format string is defined here
> >       201 |  cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect:=
 %d",
> >           |                                        ~~^
> >           |                                          |
> >           |                                          long unsigned int
> >           |                                        %x
> >
> >     fs/cifs/transport.c: In function 'cifs_pick_channel':
> >     fs/cifs/cifsglob.h:955:20: error: passing argument 2 of 'test_bit' =
from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> >       955 |  test_bit((index), &(ses)->chans_need_reconnect)
> >           |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >           |                    |
> >           |                    size_t * {aka unsigned int *}
> >     ./arch/m68k/include/asm/bitops.h:151:66: note: expected 'const vola=
tile long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned=
 int *'}
> >       151 | static inline int test_bit(int nr, const volatile unsigned =
long *vaddr)
> >           |                                    ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~^~~~~
> >
> >     fs/cifs/sess.c: In function 'cifs_chan_set_need_reconnect':
> >     fs/cifs/sess.c:98:22: error: passing argument 2 of 'bset_mem_set_bi=
t' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> >        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
> >           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >           |                      |
> >           |                      size_t * {aka unsigned int *}
> >     ./arch/m68k/include/asm/bitops.h:41:69: note: expected 'volatile lo=
ng unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'=
}
> >        41 | static inline void bset_mem_set_bit(int nr, volatile unsign=
ed long *vaddr)
> >           |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~^~~~~
> >     fs/cifs/sess.c:98:22: error: passing argument 2 of 'bfset_mem_set_b=
it' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> >        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
> >           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >           |                      |
> >           |                      size_t * {aka unsigned int *}
> >     ./arch/m68k/include/asm/bitops.h:50:70: note: expected 'volatile lo=
ng unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'=
}
> >        50 | static inline void bfset_mem_set_bit(int nr, volatile unsig=
ned long *vaddr)
> >           |                                              ~~~~~~~~~~~~~~=
~~~~~~~~~~^~~~~
> >
> >    [...]
> >
> > As bitops can only operate on long objects, and
> > cifs_ses_get_chan_index() already returns "unsigned long", fix this by =
changing cifs_ses.chans_need_reconnect and chan_index from "size_t" to "uns=
igned long".
> >
> > Fixes: 374c6c7bba3cbaa1 ("cifs: changes to support multichannel=20
> > during channel reconnect")
> > Reported-by: noreply@ellerman.id.au
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Can you please add Link: headers when committing patches?
> > I could not find this patch in the lore archives of linux-cifs or linux=
-fsdevel, presumably it was posted elsewhere?
> > Thanks!
> > ---
> >  fs/cifs/cifsglob.h | 2 +-
> >  fs/cifs/sess.c     | 6 +++---
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h index
> > 8fea2ddd2bd7af26..a9c026af21e1e9d1 100644
> > --- a/fs/cifs/cifsglob.h
> > +++ b/fs/cifs/cifsglob.h
> > @@ -968,7 +968,7 @@ struct cifs_ses {
> >          * enable the sessions on top to continue to live till any
> >          * of the channels below are active.
> >          */
> > -       size_t chans_need_reconnect;
> > +       unsigned long chans_need_reconnect;
> >  };
> >
> >  static inline bool
> > diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c index
> > 1721a3b246942266..1a17ddd6abbe5778 100644
> > --- a/fs/cifs/sess.c
> > +++ b/fs/cifs/sess.c
> > @@ -94,7 +94,7 @@ void
> >  cifs_chan_set_need_reconnect(struct cifs_ses *ses,
> >                              struct TCP_Server_Info *server)  {
> > -       size_t chan_index =3D cifs_ses_get_chan_index(ses, server);
> > +       unsigned long chan_index =3D cifs_ses_get_chan_index(ses,=20
> > + server);
> >         set_bit(chan_index, &ses->chans_need_reconnect);
> >         cifs_dbg(FYI, "Set reconnect bitmask for chan %lu; now 0x%lx\n"=
,
> >                  chan_index, ses->chans_need_reconnect); @@ -104,7 +104=
,7 @@ void  cifs_chan_clear_need_reconnect(struct cifs_ses *ses,
> >                                struct TCP_Server_Info *server)  {
> > -       size_t chan_index =3D cifs_ses_get_chan_index(ses, server);
> > +       unsigned long chan_index =3D cifs_ses_get_chan_index(ses,=20
> > + server);
> >         clear_bit(chan_index, &ses->chans_need_reconnect);
> >         cifs_dbg(FYI, "Cleared reconnect bitmask for chan %lu; now 0x%l=
x\n",
> >                  chan_index, ses->chans_need_reconnect); @@ -114,7 +114=
,7 @@ bool  cifs_chan_needs_reconnect(struct cifs_ses *ses,
> >                             struct TCP_Server_Info *server)  {
> > -       size_t chan_index =3D cifs_ses_get_chan_index(ses, server);
> > +       unsigned long chan_index =3D cifs_ses_get_chan_index(ses,=20
> > + server);
> >         return CIFS_CHAN_NEEDS_RECONNECT(ses, chan_index);  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t when I'm talking to journalists I just say "programmer" or something like=
 that.
                                -- Linus Torvalds
