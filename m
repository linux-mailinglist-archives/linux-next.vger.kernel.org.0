Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DBA21CD50
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 04:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgGMCjn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 22:39:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54541 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgGMCjn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Jul 2020 22:39:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B4nt41KKVz9sRW;
        Mon, 13 Jul 2020 12:39:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594607981;
        bh=meDA0dI9bF1M87CGnHs5FNt1rKN7p6Az2SbG8dk/I4Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JxuUPySncKAjaw33rJngbz3GRO5bLo0Y+VQhIMZXQghQKXtWD5tf1AwwF5BWMhwk7
         FGu0JoQBkVeTw9BMnBu2h+vkMhuyJS7x3FbRKC5bh/FEOn21n0nD4EnX+7HnaZD+LZ
         bPpeVy4tUgp3T9sXMmkiK7IDq2k4QjuunNIhGCGiEfi8DpLO3QuPFcVThrHQlwVQgS
         LY94Qv2VtEUsxp5oEMqQ7wEw+lPsx6vpvKDIzsB4XdnXXeXJ9Tytoxd59MSl3Dlhr6
         lGs2n+fUZqGVwDb/uqVzhIYFHoq2QZY/bFTuUvu/4861TvC68TwDUhweE2GxZvYnew
         S4YQlu7AV7Kqw==
Date:   Mon, 13 Jul 2020 12:39:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yafang Shao <laoar.shao@gmail.com>
Cc:     mhocko@kernel.org, cai@lca.pw, rientjes@google.com,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm, oom: make the calculation of oom badness more
 accurate
Message-ID: <20200713123939.6ea87a93@canb.auug.org.au>
In-Reply-To: <1594396651-9931-1-git-send-email-laoar.shao@gmail.com>
References: <1594396651-9931-1-git-send-email-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SwlqXOp1Zhki_KdvfbZLso4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SwlqXOp1Zhki_KdvfbZLso4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 10 Jul 2020 11:57:31 -0400 Yafang Shao <laoar.shao@gmail.com> wrote:
>
> ---
> v2 -> v3:
> - fix the type of variable 'point' in oom_evaluate_task()
> - initialize oom_control->chosen_points in select_bad_process() per Michal
> - update the comment in proc_oom_score() per Michal

I have applied the following incremental patch to linux-next today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Jul 2020 12:34:46 +1000
Subject: [PATCH] mm-oom-make-the-calculation-of-oom-badness-more-accurate-f=
ix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/tty/sysrq.c |  1 -
 fs/proc/base.c      | 10 +++++++---
 mm/memcontrol.c     |  1 -
 mm/oom_kill.c       |  5 +++--
 mm/page_alloc.c     |  1 -
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index e83fd46f632c..7c95afa905a0 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -382,7 +382,6 @@ static void moom_callback(struct work_struct *ignored)
 		.memcg =3D NULL,
 		.gfp_mask =3D gfp_mask,
 		.order =3D -1,
-		.chosen_points =3D LONG_MIN,
 	};
=20
 	mutex_lock(&oom_lock);
diff --git a/fs/proc/base.c b/fs/proc/base.c
index bf164064b901..10c2a26c0e20 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -554,10 +554,14 @@ static int proc_oom_score(struct seq_file *m, struct =
pid_namespace *ns,
 	long badness;
=20
 	badness =3D oom_badness(task, totalpages);
-	if (badness !=3D LONG_MIN) {
-		/* Let's keep the range of points as [0, 2000]. */
+	/*
+	 * Special case OOM_SCORE_ADJ_MIN for all others scale the
+	 * badness value into [0, 2000] range which we have been
+	 * exporting for a long time so userspace might depend on it.
+	 */
+	if (badness !=3D LONG_MIN)
 		points =3D (1000 + badness * 1000 / (long)totalpages) * 2 / 3;
-	}
+
 	seq_printf(m, "%lu\n", points);
=20
 	return 0;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4ae64726f863..430d4c659669 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1666,7 +1666,6 @@ static bool mem_cgroup_out_of_memory(struct mem_cgrou=
p *memcg, gfp_t gfp_mask,
 		.memcg =3D memcg,
 		.gfp_mask =3D gfp_mask,
 		.order =3D order,
-		.chosen_points =3D LONG_MIN,
 	};
 	bool ret;
=20
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 8fdb8b03f5cd..48e0db54d838 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -306,7 +306,7 @@ static enum oom_constraint constrained_alloc(struct oom=
_control *oc)
 static int oom_evaluate_task(struct task_struct *task, void *arg)
 {
 	struct oom_control *oc =3D arg;
-	unsigned long points;
+	long points;
=20
 	if (oom_unkillable_task(task))
 		goto next;
@@ -361,6 +361,8 @@ static int oom_evaluate_task(struct task_struct *task, =
void *arg)
  */
 static void select_bad_process(struct oom_control *oc)
 {
+	oc->chosen_points =3D LONG_MIN;
+
 	if (is_memcg_oom(oc))
 		mem_cgroup_scan_tasks(oc->memcg, oom_evaluate_task, oc);
 	else {
@@ -1124,7 +1126,6 @@ void pagefault_out_of_memory(void)
 		.memcg =3D NULL,
 		.gfp_mask =3D 0,
 		.order =3D 0,
-		.chosen_points =3D LONG_MIN,
 	};
=20
 	if (mem_cgroup_oom_synchronize(true))
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0832b21a7728..65fc0ed784d2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3915,7 +3915,6 @@ __alloc_pages_may_oom(gfp_t gfp_mask, unsigned int or=
der,
 		.memcg =3D NULL,
 		.gfp_mask =3D gfp_mask,
 		.order =3D order,
-		.chosen_points =3D LONG_MIN,
 	};
 	struct page *page;
=20
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/SwlqXOp1Zhki_KdvfbZLso4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8LyWsACgkQAVBC80lX
0GwsQwf+MvITQBZmDC5WElRjiWzEEz6ui44gEi4E5WFUCtdBY8l5wAABXqKaTMis
RNLltytDctJkRYRQOdZtEkZ9+wPYVStp7Ln90l/W2fI97GVK27uk2v5EeK1u9a3I
k//fPNfJXjuZ/j2MYA1dfInIjpp6GMcSfPjldIyWmdYnTaoom4JEEt1bVjx7fZy2
/DvA5TpCi2Vw3BrzsZm/mfBhQgfjbzuvQHLwNXKNyp+nM+MkprPLDeTXw0hfDJ4/
iPXOpe6NeaSUQCiz/WjbcjhgZ88vycWYDfUjejM5ewFou//GQ6P2wRpo2bDgpyB/
s9NOwZcH2ZgnkUFugI31lXFpXe1ioQ==
=pAno
-----END PGP SIGNATURE-----

--Sig_/SwlqXOp1Zhki_KdvfbZLso4--
