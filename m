Return-Path: <linux-next+bounces-6770-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE5AB6798
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 11:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8DE189865F
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 09:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3424222A7E6;
	Wed, 14 May 2025 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="V1y2U95H"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922922A4D8;
	Wed, 14 May 2025 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215205; cv=none; b=XKTRqSN7cADBV1psD14tBaZpXkaQL5AzXUztyilVeKBPP5wDjPO46SyuUSdpKyQZ8Lv26t7WK0DW0BX8FjsWU9g2gS2gmm4PvDpgZ7gCInXwpngxGLjeTY2zH5WC3n1gmHhOTyYA1BdsPnXgZfwPKb6PDzodwVfhFyngHvDOxAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215205; c=relaxed/simple;
	bh=miHtmJi2alTOxp0GJupuQfr9NbRVcfj7t9qbEt+CkuA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SrYVhcH5PGYhDCVwFIXjxwhTg4Q9o9HaWtmq6vMaCVmFhChLjCTCDrmUhrEZ4oesC+gaUIyPQr0B7eP3W2u1j+UCdHOguJyHXZ8omvTmhOq6aCkvXG3zgYaMpLgVm5Lz4xLSuZOrak+lYhUSaS0T4/g3HcEWvnt3cvRRRw/DvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=V1y2U95H; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747215180; x=1747819980; i=spasswolf@web.de;
	bh=oyBnmSlIzSUHnd09jKaBmwrBIv2Cq1rU0CHAjzlgAyw=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V1y2U95HGYfu/cQpTOdJXGPWSL2E10jbckhTgMqY3pryySWPGB8RuF5bb384n9Ln
	 EM+Qx80dwHfG97Uf7zKqpbk/YB2dwd5ZxqL2lVfUk8mJNFvVvsZAO6J5oz96YU6Bf
	 nVLV3NRTg/p7qpuj2y+R7grZ9svrDoPPNPuJ5SyZlZY9ekLIVuqm0EFdiJouhSjJ9
	 qUtMa/gy6cfdrrkobE8WCcrANI23T2DdtaaciuwgAXBn4IDBYnjeLupGcQz++8qWg
	 EYfNxqhXYulpnl9nrr7k4nL+QUIiYXHUG0JHG0fQDUBJxUBk8DVNe5vSZ27H0CZvB
	 CFuVpv1Qfw4GktmMsg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7QUJ-1v2yI50YEH-0180wd; Wed, 14
 May 2025 11:33:00 +0200
Message-ID: <b644ff1714731cfb652d809d4864f0d178b24a97.camel@web.de>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when
 compiled with clang
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, llvm@lists.linux.dev, Johannes Berg	
 <johannes.berg@intel.com>, spasswolf@web.de, Thomas Gleixner
 <tglx@linutronix.de>
Date: Wed, 14 May 2025 11:32:58 +0200
In-Reply-To: <7471a185adcc34a79c2ab8ce1e87ab922ae2232b.camel@web.de>
References: <20250513164807.51780-1-spasswolf@web.de> <87h61ojg3g.ffs@tglx>
	 <7471a185adcc34a79c2ab8ce1e87ab922ae2232b.camel@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z9f+FBmpI6CKPZ4U3J4iY7BOuQWizzUEw39fK2w6yLquPr4XJlH
 3sjGwlUhRWwd0ppHynUUIf+p6YFaJTojRUbmRvqUP7WeHYdfWw6Gm45NZEHUOHB/QkVY5L/
 duy3k9mvGe8YUXSH8McsJgD2jXpl4q5mdYPXgUZCaEXMbJyQwBNNPF3RwwmEhWNCuac5X62
 BIRA3oInY35aplzMLq/kA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r87TRTUMPKE=;VLAAbX6nMiBvVz78pNITpFcja2w
 BjY0zBVl1ln0sPb/2qqw2DFDKP8G606EZNZeVlRBziADubDnkF5JOp3hn7Ic5nWH6mxyVrpxN
 zy91GXlEecNCvci9rnKFYWGTl0pQfiTbw6Uz8IK/7PjN3FOPk6mLCp/Y41vPl5IDo3U9fRO9O
 CLf68Q8OiGtLEnuSXVCmm6BepUvVAwdKgjhSC7RVTgYKIWd9H6Ig+T0AmV84PDU6/fU/vGX63
 CXsGkQB0bf6QgWcmcPYMZCAa0MydwOXVT1UwHG9ja168PpEm954uSatv5NE9oOucvq3YRFpK1
 JqWSnUCOcPXlR7bPY8jCK5vamBwLwZvNHHbOi0rhi3BzQa7tykqyy4UrBFVb28Sw8HudA5lkY
 wLZtn46fFSfU16nSjSzS75yhdd9SJFl+NZJStGsUfw1UFtCuGCHfaKldLgC2kpGjXznudD0Sj
 lKGXPcQ9fFRkZz3sVcb3QOaN+WLeRMzpZwVO9pGbV1br3b5ovNtJcES7h6JAqUzC6JDgM9gO8
 QGhOv1prOHfnbvLxiSM8FPXp5alO6YY/63JPin/Y39vNbbkdy1LaT5tG+xx3Jv0kDIof1caoE
 MtxCQX4bBZ4sTEyHHyoQA1HdzfOPEyz0Nw0vT5RWBTtOPpxmBSjoSheZCmy4JnP2/BON5XwaK
 jU7lvSduCjh9FG/9DIkIMBazjE62Lp2K9rfpVPImYaLNTM8Qf7CXAZtBy28ZA804B5ghuf/VS
 pCMa6q0YJevHih0StWsZ0oMMg7UABtTchecm8Od1AF/MaoWGWaHhnASIoSd3mr2rdWOGRNaqP
 RrDz5xSDLtFSDKHnVTorzHlCwSUMdqebCoBitN6WFh2o6J3Ggun6AtUnU15QnHa0+h9zOz8OD
 J3MgqS/Pg9E6R7d3NR/NXjK35hi9DOszesOXkWrzMX8gFP+e6/A2Jw2boJ+2iCZTEHWZbS9I5
 zdXF+5+a4i797WLO6l8jNz6rJVgBmOaNUxinPNzYzOyuHXdUdX75gyhEIzbEDKUA5CTbfA02H
 0IPS+xbFffCViN0fl8Sl5nz7KBgD4Uky2cRE+vwCjZngFFP31O8i7CvKjhQEHWEAAGU0TA9hk
 J9v4AX8d3LGHnFit9a3KkqX/q5GOM48fM0reAEIJ/HNKsTj9Y4rxexqoBwo5xk4c5CMClmux5
 d+FLS/yMkJTVdjLpuaWYTEHbzgUEEISQ0wuNrKQ7M0uzBy5UK23zPMuYSAqZdf0/8pML8E4FR
 w1IDeB0cBc1WEAbsdGoKXNZt8WUEIDPakX6Av96OAemyECK/qgXMgkfr4CpMWhdCaZwKJSaxO
 QvEeYOD0ICbU0tL4Zi7HhaRfnl0mRRlJnKsw+5fGK3nISXGHsk94qH8UJeXz/cNBoHZs7yKv9
 G3X9HuIQ8mSgrovjSfkTWU1THqzpn1pGdHGhiHcHRqWYxZynWM6V0ITUOg5EV5MjvcpUzENDY
 jzrLzb4Gd6Ka34zK82jskKS1783xycyWgSuEPUheDalKodD7DrfCo8gkqSLtgnyMyKuaeB5zL
 csa4S+y4ob4QG4xHlUHtpWv++cZI1sZVJqdWa7Y3+O+b2flFvuYhuqBBESnryho0bRWCP+2iw
 eUENsknYOeoPCAx90LJ5rxqgaJDhIyv5GxCOP9wvj5h6/A9xVvud2TIMNQezhMQeIAQSbZ5Oz
 A0cswuKREAKEF98rZeV9CMHvcRMdITbmw7Z7I3XrRAgt8EFaEgMdpYlKOfHigsak7G/0/ifOJ
 e2V5STBuefDGpZVgw8ftjVLacoLmeBQkwCZaCeNVR3jkL1wbBcKgQZ8udq5hv9l8abNRsvhWu
 V5XbnOh22rJGyG+vOQKqIY+8gIrGi32KBaLbRBFbda/EWVuzIaW2aAmeR7tR04IVVKYrSMV9K
 Vxtt6OFjXA1d/6AmwWcj1KMWA9wi67d+Kqqrn3lIc+QihufR2QQG6c0iBl9yiGYUQ14x+wt6g
 APpjGKsI77xSyc+JbvG3oa6jLQqQpSpGED3hM5k+BIEc9vsioQB8ln0AqzC6OyywVo2Jof2q+
 MABoad8vQzyuJ7md//6EpkgNNpZLFCsqi34KhYdkqVFc/FGi7x4VZALdflC6UGPzmVPScZMuo
 k8D4EdFB29Za1A/GVjs3ytyGlxVE6KfN6qNj4oR/ETkmTuKzqEk2OOo5dSYoPLnoytMZZXZtN
 /uImlZzFKvvFuAtUyL2AQTYzCvFe6IcArLASYpz1opIXAzUoskvNciVQZyeD/7bS+If9bu+Vi
 CekCoT/gwikGkY2TtPxL59rxt64ov0/YUJ0X9ox+8XHTA0DaCgTFX6naGo+nV8SlyivYn1ufs
 T1xkGSSzO6vuK+nCX3h5X/0UMlCPweA8kaV9HPVyEkxrRAK251G0+yvYLG7L0R5WRhVsPDz/J
 X8wLCtnvuEGcL2wfsIfq+8we7chNSpAvm2mJfN8d3/XdOjPm1EgSNQIzo6+ih0OQhefF/NV/E
 yNnWQbQ2YVM8qwd46dj0uyI2HRs43z9sPxi2HmKeZNTd1CW1k1LKowTWpBcoYDnYiZELzu2zI
 sSbKRpE/GFba+pjU30PNAqKv2k+z+z10fZ011WVGxMeTreVW2TgF6PVtHKM22ko2FWqjIZAtX
 9OAjJ9uYzZKY+LW4CZTQy8g627yd0OwtRLEtKtL/4CcnUbjSXkEoNk16dWxKIILV9SQ6aqgGk
 b3JBsqtqlBPh3VIGnTCwFbcPkmyqSh5OANdrLBnuSGVBAFrYk0nRcZo4t0ilIlMnRIOhuyOCw
 I4xtQO753PMtbpO0F56g/cK9IsS4J1ji39OyhkqOIswZCKkMcdqOPAFaE97KXqTIMhJxwYMyL
 QGwY5jxXjLvEgC3bKsRQJ7OeUrgkUhvFOOR35whvyuCsMmZwg44kJJ8ylJvX56n5mxrsqGQsc
 x5Q4lqtc+Vg7Z8RPeDhbwTXYhmYKW6O1u94TEC5GdSKPmxyUT7MnswNFeLlcyAkm9Pw0mzw4b
 G1IanTLds8R9jQs0C+MyHQkQtiQY7Rw+jAgBN3xxR6hx4aouVIZkBCbvwVT+6nH6aG1QBLu4R
 MYgkIbBKtovqo39haD5pihyqMixEO+ukozX84Unu3JgCsMjs9n4U26q+t01L4dcLTBVw6ghu7
 rts8Tm0OvZyI8zxxoMw/DnE1jO4qwnj8+XsGBrEceU4R0/FmK/PsYmBg==

Am Mittwoch, dem 14.05.2025 um 02:11 +0200 schrieb Bert Karwatzki:
> Am Mittwoch, dem 14.05.2025 um 00:33 +0200 schrieb Thomas Gleixner:
> > On Tue, May 13 2025 at 18:48, Bert Karwatzki wrote:
> > > >=20
> > > > I'll now start a bisection where I revert 76a853f86c97 where possi=
ble in
> > > > order to find the remaining bugs.
> > >=20
> > > The second bisection (from v6.15-rc6 to next-20250512) is finished n=
ow:
> > >=20
> > > This commit leads to lockups and kernel panics after
> > > watching ~5-10min of a youtube video while compiling a kernel,
> > > reverting it in next-20250512 is possible:
> > > 76a853f86c97 ("wifi: free SKBTX_WIFI_STATUS skb tx_flags flag")
> > > This commit leads to the boot failure, reverting leads to the
> > > compile error it is supposed to fix:
> > > 97f4b999e0c8 ("genirq: Use scoped_guard() to shut clang up")
> >=20
> > I really have a hard time to understand what you are trying to explain
> > here. 'This commit leads..' is so unspecified that I can't make any
> > sense of it.
> >=20
> > Also please make sure that you have commit b5fcb6898202 ("genirq: Ensu=
re
> > flags in lock guard is consistently initialized") in your tree when
> > re-testing. That's fixing another subtle (AFAICT clang only) problem i=
n
> > the guard conversion. If it's not in next yet, you can just merge
> >=20
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
> >=20
> > into next or wait for the next next integration.
> >=20
> > Thanks
> >=20
> >         tglx
>=20
>=20
> I merged git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/c=
ore into
> next-20250513 and this fixes the boot failure but the system still locks=
 up
> after a few minutes (with flashing capslock). To solve this I need to re=
vert=20
> 76a853f86c97 ("wifi: free SKBTX_WIFI_STATUS skb tx_flags flag")
>=20
> Also commit 97f4b999e0c8 did not actually cause the boot failure that wa=
s a
> bisection error.
>=20
> Bert Karwatzki

To investigate the problem with commit 76a853f86c97 ("wifi: free
SKBTX_WIFI_STATUS skb tx_flags flag") I used next-20250513 with irq/core m=
erged
to fix the boot issue and the reverted commit 76a853f86c97.=20

$ git log --oneline
bb3ff0e21a16 Revert "wifi: free SKBTX_WIFI_STATUS skb tx_flags flag"
28d1f7734aa3 Merge branch 'irq/core' into clang_panic
aa94665adc28 (tag: next-20250513, origin/master, origin/HEAD, master) Add =
linux-
next specific files for 20250513

Then I reapplied commit 76a853f86c97 hunk by hunk and found the one hunk t=
hat
causes the problem:

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 3e751dd3ae7b..63df21228029 100644
=2D-- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4648,8 +4648,7 @@ static void ieee80211_8023_xmit(struct
ieee80211_sub_if_data *sdata,
                        memcpy(IEEE80211_SKB_CB(seg), info, sizeof(*info))=
;
        }
=20
-       if (unlikely(skb->sk &&
-                    skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS)) {
+       if (unlikely(skb->sk && sock_flag(skb->sk, SOCK_WIFI_STATUS))) {
                info->status_data =3D ieee80211_store_ack_skb(local, skb,
                                                            &info->flags, =
NULL);
                if (info->status_data)

This is enough to cause a kernel panic when compiled with clang (clang-19.=
1.7
from debian sid). Compiling the same kernel with gcc (gcc-14.2.0 from debi=
an
sid) shows no problem.

The wifi card used is
04:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E=
 80MHz
[14c3:0608]

Bert Karwatzki

