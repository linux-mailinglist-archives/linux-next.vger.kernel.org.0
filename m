Return-Path: <linux-next+bounces-9562-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE54CFB713
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 01:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC03302684F
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 00:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECA178F26;
	Wed,  7 Jan 2026 00:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rTJSfGKV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B97DF76;
	Wed,  7 Jan 2026 00:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767745034; cv=none; b=EubYJvyZlqRPrN19/6VSS75ztpXSeeucvSTjf2NLmYHacvwWgRql2H9tM+/wzDvmKK+9JS1fEMw+rYC424Lau7V/bgCzR0e8tkvtvZdBwrFH9qPZ7mN2SOraakYFdqu44AIE44B2dSfqjxdME8BMDuE824hidTLZLIAZMWObNSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767745034; c=relaxed/simple;
	bh=KX20taIYdLvUo9TQ5RKzYDdqrozdWxmXjbRrDerHuwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OnHqDoFL4XJ96Xfnhlz2byvf22paFmqzwX8B/0XE7RZsX8YTz/dx31SLTQpJKjCN2ImtIrOsVA2gm7TPbroMMFKuUgusKkkk4q2I76jMbfj0YtE2K3U2qPVompOZntmf9utWEXl/KUP0ZeD4Z5tsOytipRDhnKk3cZEdTCuPsB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rTJSfGKV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767745018;
	bh=dmF3QmhwxFonzrvsZ/jhDK0p8hSqz6QmJwUpM1mcDWQ=;
	h=Date:From:To:Cc:Subject:From;
	b=rTJSfGKVsEJGhtfEzlhtW8IGZPL0vPP6huTmrGpD6b1wQl2p/K41usZMziGisms2Z
	 TRLVJ66lCIWL6jIGuvi4ZZ3J0lmaA4RrWgAEulKNlyeWKLhp+O6XKMuFsAwD9hjZGW
	 H+sCOlNmaBaZGfnorlvl/E8Xh+Cx5gpufnQBeQRuCGqQsZTClFl3K9V4a1pmw3yHVt
	 1CWtCNfBuieyvk682cFCvoZski6n3OP/gla4ORImTrzAcOSjyubWYisRAZw0XntmQH
	 cFoilDObGCgjepl8BzCospfNBlZr8sjZS3yTVhU6KvrC6WH7Y+OT4M9OpzRUEzlvbk
	 veU8+V0HA7PUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dm7rV3zwnz4wMG;
	Wed, 07 Jan 2026 11:16:58 +1100 (AEDT)
Date: Wed, 7 Jan 2026 11:16:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Ballasi <tballasi@linux.microsoft.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-unstable tree
Message-ID: <20260107111657.1f30d1f6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ARSQ7g.47RA=LTrhq=mKHXv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ARSQ7g.47RA=LTrhq=mKHXv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/trace/define_trace.h:132,
                 from include/trace/events/vmscan.h:569,
                 from mm/vmscan.c:73:
include/trace/events/vmscan.h: In function 'do_trace_event_raw_event_mm_shr=
ink_slab_start':
include/trace/events/vmscan.h:248:68: error: invalid use of undefined type =
'struct mem_cgroup'
  248 |                 __entry->memcg_id =3D sc->memcg ? cgroup_id(sc->mem=
cg->css.cgroup) : 0;
      |                                                                    =
^~
include/trace/trace_events.h:427:11: note: in definition of macro '__DECLAR=
E_EVENT_CLASS'
  427 |         { assign; }                                                =
     \
      |           ^~~~~~
include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
  435 |                       PARAMS(assign), PARAMS(print))               =
     \
      |                       ^~~~~~
include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVE=
NT_CLASS'
   40 |         DECLARE_EVENT_CLASS(name,                              \
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
   44 |                              PARAMS(assign),                   \
      |                              ^~~~~~
include/trace/events/vmscan.h:214:1: note: in expansion of macro 'TRACE_EVE=
NT'
  214 | TRACE_EVENT(mm_shrink_slab_start,
      | ^~~~~~~~~~~
include/trace/events/vmscan.h:237:9: note: in expansion of macro 'TP_fast_a=
ssign'
  237 |         TP_fast_assign(
      |         ^~~~~~~~~~~~~~
include/trace/events/vmscan.h: In function 'do_trace_event_raw_event_mm_shr=
ink_slab_end':
include/trace/events/vmscan.h:293:56: error: invalid use of undefined type =
'struct mem_cgroup'
  293 |                 __entry->memcg_id =3D cgroup_id(sc->memcg->css.cgro=
up);
      |                                                        ^~
include/trace/trace_events.h:427:11: note: in definition of macro '__DECLAR=
E_EVENT_CLASS'
  427 |         { assign; }                                                =
     \
      |           ^~~~~~
include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
  435 |                       PARAMS(assign), PARAMS(print))               =
     \
      |                       ^~~~~~
include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVE=
NT_CLASS'
   40 |         DECLARE_EVENT_CLASS(name,                              \
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
   44 |                              PARAMS(assign),                   \
      |                              ^~~~~~
include/trace/events/vmscan.h:266:1: note: in expansion of macro 'TRACE_EVE=
NT'
  266 | TRACE_EVENT(mm_shrink_slab_end,
      | ^~~~~~~~~~~
include/trace/events/vmscan.h:285:9: note: in expansion of macro 'TP_fast_a=
ssign'
  285 |         TP_fast_assign(
      |         ^~~~~~~~~~~~~~
In file included from include/trace/define_trace.h:133:
include/trace/events/vmscan.h: In function 'do_perf_trace_mm_shrink_slab_st=
art':
include/trace/events/vmscan.h:248:68: error: invalid use of undefined type =
'struct mem_cgroup'
  248 |                 __entry->memcg_id =3D sc->memcg ? cgroup_id(sc->mem=
cg->css.cgroup) : 0;
      |                                                                    =
^~
include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_C=
LASS'
   51 |         { assign; }                                                =
     \
      |           ^~~~~~
include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
   67 |                       PARAMS(assign), PARAMS(print))               =
     \
      |                       ^~~~~~
include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVE=
NT_CLASS'
   40 |         DECLARE_EVENT_CLASS(name,                              \
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
   44 |                              PARAMS(assign),                   \
      |                              ^~~~~~
include/trace/events/vmscan.h:214:1: note: in expansion of macro 'TRACE_EVE=
NT'
  214 | TRACE_EVENT(mm_shrink_slab_start,
      | ^~~~~~~~~~~
include/trace/events/vmscan.h:237:9: note: in expansion of macro 'TP_fast_a=
ssign'
  237 |         TP_fast_assign(
      |         ^~~~~~~~~~~~~~
include/trace/events/vmscan.h: In function 'do_perf_trace_mm_shrink_slab_en=
d':
include/trace/events/vmscan.h:293:56: error: invalid use of undefined type =
'struct mem_cgroup'
  293 |                 __entry->memcg_id =3D cgroup_id(sc->memcg->css.cgro=
up);
      |                                                        ^~
include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_C=
LASS'
   51 |         { assign; }                                                =
     \
      |           ^~~~~~
include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
   67 |                       PARAMS(assign), PARAMS(print))               =
     \
      |                       ^~~~~~
include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVE=
NT_CLASS'
   40 |         DECLARE_EVENT_CLASS(name,                              \
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
   44 |                              PARAMS(assign),                   \
      |                              ^~~~~~
include/trace/events/vmscan.h:266:1: note: in expansion of macro 'TRACE_EVE=
NT'
  266 | TRACE_EVENT(mm_shrink_slab_end,
      | ^~~~~~~~~~~
include/trace/events/vmscan.h:285:9: note: in expansion of macro 'TP_fast_a=
ssign'
  285 |         TP_fast_assign(
      |         ^~~~~~~~~~~~~~

Caused by commit

  6093cd0a2a93 ("mm: vmscan: add cgroup IDs to vmscan tracepoints")

$ grep MEMCG .config
# CONFIG_MEMCG is not set

I have applied the following hack for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 7 Jan 2026 10:38:50 +1100
Subject: [PATCH] fix up for "mm: vmscan: add cgroup IDs to vmscan tracepoin=
ts"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/trace/events/vmscan.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/trace/events/vmscan.h b/include/trace/events/vmscan.h
index d438abfa03eb..6a8ec045ae58 100644
--- a/include/trace/events/vmscan.h
+++ b/include/trace/events/vmscan.h
@@ -245,7 +245,11 @@ TRACE_EVENT(mm_shrink_slab_start,
 		__entry->priority =3D priority;
 		__entry->nid =3D sc->nid;
 		__entry->pid =3D current->pid;
+#ifdef CONFIG_MEMCG
 		__entry->memcg_id =3D sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;
+#else
+		__entry->memcg_id =3D 0;
+#endif
 	),
=20
 	TP_printk("%pS %p: nid: %d pid: %d memcg_id: %u objects to shrink %ld gfp=
_flags %s cache items %ld delta %lld total_scan %ld priority %d %s",
@@ -290,7 +294,11 @@ TRACE_EVENT(mm_shrink_slab_end,
 		__entry->nid =3D sc->nid;
 		__entry->retval =3D shrinker_retval;
 		__entry->pid =3D current->pid;
+#ifdef CONFIG_MEMCG
 		__entry->memcg_id =3D cgroup_id(sc->memcg->css.cgroup);
+#else
+		__entry->memcg_id =3D 0;
+#endif
 	),
=20
 	TP_printk("%pS %p: nid: %d pid: %d memcg_id: %u unused scan count %ld new=
 scan count %ld total_scan %ld last shrinker return val %d %s",
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/ARSQ7g.47RA=LTrhq=mKHXv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmldpfkACgkQAVBC80lX
0GyaawgAlKUJCT7AUt+0FoU+r3tzccJFcaYmxrN4xbQxAQCPlY3/+ajaosYdbzOS
oAXIgk7Kzz5lQdfU1eW4ki3ZWW43VRGF2U7SPVE7aCDwvP7NPzNzXrXcXWKKsz8H
V/dRZkZj6cKUS1iJlvxJmMV+FE1PS5wsFZ7nVI0RkEfoH6bR0R6IZzeGIHHkQgvN
9+DXpn4QTlMpsQ4tFFbzYSuBp2B/72esZu+Q3nbh6a2rMpgVE4b/Y8xXocHNryL7
Sy8fK9L4MYF5QNuDHS80RjmiEB0MQXf98104iayaKWeDr3YocS/ToSNH4ONHI9QR
4PKtzmMoxQDpJBDHOoXpEBMQMedMLA==
=w4sP
-----END PGP SIGNATURE-----

--Sig_/ARSQ7g.47RA=LTrhq=mKHXv--

