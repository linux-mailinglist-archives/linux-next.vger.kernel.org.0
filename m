Return-Path: <linux-next+bounces-2971-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F692FA0D
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 14:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAE9F1F22548
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD39415A4B3;
	Fri, 12 Jul 2024 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="t8t+6/Ye"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9471640B;
	Fri, 12 Jul 2024 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720786703; cv=none; b=PP/7GmGwT8/RC5VUn0e5Xfp6NePsfwkp4No7/b7fwHB8BEt3IMPuu6ghobz38IPugubfDmPIVjotDAQD61FU/k25vmqLA0XdBVDiTDTlQs7/Dn1uAUQLqd4DTnL418S8OIkydcPSe9QD0If0PL7VnMQNDPmRvy48u4L02vvnIlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720786703; c=relaxed/simple;
	bh=43rWBxFOy1IaWeBsSN18ZiL0vVYHQa8at9qTbLs2uQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbjawyJDYSt2PUlLoett0k19kSbrdggDf5q2sjDTKmD8e4WiWW/4xGZgM+1hkQyss/J9NRSU1GiFzsLynpw4Wy4dWDhLWIAjNA2OuB8JayRnTvXXcht/uMPmOaLFZRndW+8fPaO8jffaJ2lQoEBF6BbYeNRnmdEirybx8Bfu240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=t8t+6/Ye; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720786685; x=1721391485; i=spasswolf@web.de;
	bh=aH971ZcYcuKRlw99KTDLXdXUre9wbPrQuEQ7oEy6AM4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=t8t+6/YeiqvIKqzXD77a6i1LChN/YJw32EpJVAePM7WqRMC1UR+zRtXlCoclu8vQ
	 A5Vv1I6gqhjJChg9kInuwYFutv1ApWK21c4ni3Xz+tNfUgR0K0ku1FMWM3wLCj1OD
	 mtu/7zHrKNtK0TjOhavNaBfSDVYWGu9D+xpn7+WnHgL8pdSG7oxmKU/8mBBK14ruG
	 0kj4RyzKiLC46UzMaOMWsfMo4TC8GpSphp3MKkK1wYI57WwjYFgctXnDK07X9vvol
	 Z4ATKoAMhWmtYvGMjsvZtBwX8evK/IoGZteeOBoPp1G5+WKxPG24ilIIX1ScSsJGA
	 mEmavoeocuHE6SscQg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MW9vU-1sr4Fz2U8Y-00Vw7o; Fri, 12 Jul 2024 14:18:05 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jiri Olsa <olsajiri@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and firefox-esr crash in linux-next-20240613
Date: Fri, 12 Jul 2024 14:17:59 +0200
Message-ID: <20240712121800.3049-2-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: w5uejhiciolye2ikgsdjim25z7lau7km3tu6t2vby3kuxeshos@osowmu4ecng5
References: <20240712121800.3049-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lm2S/ia/Jix3RenHRKu3xYElKTHcTZSwP5qZYKgYMUWXoG1ve7T
 6Q+Wl15ndk9Iw2C+l2yM8lICcRP3yYA2lc3bWmbBB7nKGfuGnC4EVyaaIGiW8wW+qLb431s
 Rl2sMfpOG2n6tRCPEf5CHtL21I9tKfXXn/+reZqi9UR0mgrTvAF2EUxl3PcTDT/75Fp8BwE
 SAurO5IvvitbC23R2lgYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rIDjLwQxHc0=;4umfiRb0yubOyPWx0dtO+KQlfv5
 KA40BSQ62n4jOdARMgZaJ+c/ZYGeSm4rmwOYxvgg/KPT6oS0UrP+zF3uYBPmXBG1Ev3QVjqcv
 1EvnqFg6CnIFn1lJIcBCKZhjmRkeGwkZjEXP9FUPZ1mtNXMEvPsYESzLNLNqKFZ6DI/Nrvx1o
 VzKLVhAjTz6R/uuRGaVRfac50h43VoH6gFrdV8Ngv06797bBytrUcfxmlrs10jmtIkuRGoUUc
 6EqGxLBa6321EUU9GumKx3SRS/LuTICIe1iInRouOguXn6w0prii5RC1NYkzLNxP/lUz4xXQD
 hGDg/1+xWW4Bzl4C+7+hW9Wszy+sg+6z8vB+3IYWx9ZukT/SvmwWSjyanV97EJ5wlscIKyjB6
 +BPzPQfsMl/z7B/q/JiZnPy3oluBoxDmmukgVWnd2AfuHBoIaCq3DsKjwUWsF1bkDz+a4F1lD
 n2KtSSk+bZQw0GFfdGOxPh5pFxkkeQnytfIt+C5hNDXGGRlLa6qNVxd1GBbHQyqxujymz+RsG
 qUNbBoAvF/3mlkQx5GJJzKKkffMGHiGdi9HXfgIT0gBcRgVN8GiYQd7xPTLk5OXXsBCOE6VmR
 zBxQcJIl37QGu6sSHOnM80G+GWkqIZm/Nqfcu+Gbw83RsDNlB9ZMS0ZAEs7Y4m0QY64iZZM2h
 roiMrxOgaMkqijzZzw2Xq8Y5hG6TemIxsLszCruxicijyqzoYCfohTGouMlWMXmaJSGH44y+z
 Kii650jpesv0D8WulrMpxjS+ITEwJjm29R2sbFoLFxwTj5xWERtkMpFfN94sdolwlHlEL8AOZ
 GznLH2Zif+acMLEipRRdrwLQ==

I did some experiments on the rss counter bug. The next patch is made for =
linux-next-20240613
with commit 1c29a32ce65f4cd0f1c0f9 reverted. Then I simply inlined the cod=
e of do_vmi_unmap()
and do_vmi_align_munmap() into mmap_region(). This version of the code wor=
ks fine and does not
show the rss counter bug.

diff --git a/mm/mmap.c b/mm/mmap.c
index f95af72ddc9f..0f020c535c83 100644
=2D-- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -733,7 +733,6 @@ int vma_expand(struct vma_iterator *vmi, struct vm_are=
a_struct *vma,
 	vma_iter_store(vmi, vma);

 	vma_complete(&vp, vmi, vma->vm_mm);
-	validate_mm(vma->vm_mm);
 	return 0;

 nomem:
@@ -2911,6 +2910,8 @@ unsigned long mmap_region(struct file *file, unsigne=
d long addr,
 	struct vm_area_struct *next, *prev, *merge;
 	pgoff_t pglen =3D len >> PAGE_SHIFT;
 	unsigned long charged =3D 0;
+	struct vma_munmap_struct vms;
+	struct ma_state mas_detach;
 	unsigned long end =3D addr + len;
 	unsigned long merge_start =3D addr, merge_end =3D end;
 	bool writable_file_mapping =3D false;
@@ -2933,12 +2934,46 @@ unsigned long mmap_region(struct file *file, unsig=
ned long addr,
 			return -ENOMEM;
 	}

-	/* Unmap any existing mapping in the area */
-	error =3D do_vmi_munmap(&vmi, mm, addr, len, uf, false);
-	if (error =3D=3D -EPERM)
-		return error;
-	else if (error)
-		return -ENOMEM;
+	/* Find the first overlapping VMA */
+	vma =3D vma_find(&vmi, end);
+	if (vma) {
+		struct maple_tree mt_detach;
+
+		/*
+		 * Check if memory is sealed before arch_unmap.
+		 * Prevent unmapping a sealed VMA.
+		 * can_modify_mm assumes we have acquired the lock on MM.
+		 */
+		if (unlikely(!can_modify_mm(mm, addr, end))) {
+			return -EPERM;
+		}
+
+		 /* arch_unmap() might do unmaps itself.  */
+		arch_unmap(mm, addr, end);
+
+		mt_init_flags(&mt_detach, vmi.mas.tree->ma_flags & MT_FLAGS_LOCK_MASK);
+		mt_on_stack(mt_detach);
+		mas_init(&mas_detach, &mt_detach, 0);
+
+		init_vma_munmap(&vms, &vmi, vma, addr, end, uf, false);
+		error =3D vms_gather_munmap_vmas(&vms, &mas_detach);
+		if (error) {
+			validate_mm(mm);
+			return -ENOMEM;
+		}
+
+		vma =3D NULL;
+		error =3D vma_iter_clear_gfp(&vmi, addr, end, GFP_KERNEL);
+		if (error) {
+			abort_munmap_vmas(&mas_detach);
+			return -ENOMEM;
+		}
+
+		/* Point of no return */
+		vms_complete_munmap_vmas(&vms, &mas_detach);
+	} else {
+		// TODO
+	}

 	/*
 	 * Private writable mapping: check memory availability

The next patch now moves the call to vms_complete_munmap_vmas() towards th=
e end of
mmap_region(). This code is also free of the rss counter bug.

commit a4b24bb18dde627792297455befcc465e45be66d
Author: Bert Karwatzki <spasswolf@web.de>
Date:   Thu Jun 20 17:02:08 2024 +0200

    mm: mmap: push back vms_complete_munmap_vmas()

    In order to to debug the rss counter bug we're going to push back
    vms_complete_munmap_vmas() in mmap_region.

    Signed-off-by: Bert Karwatzki <spasswolf@web.de>

diff --git a/mm/mmap.c b/mm/mmap.c
index 0f020c535c83..4fb9dd2e6d6e 100644
=2D-- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2970,9 +2970,9 @@ unsigned long mmap_region(struct file *file, unsigne=
d long addr,
 		}

 		/* Point of no return */
-		vms_complete_munmap_vmas(&vms, &mas_detach);
 	} else {
-		// TODO
+		vms.end =3D 0;
+		vms.nr_pages =3D 0;
 	}

 	/*
@@ -3016,6 +3016,11 @@ unsigned long mmap_region(struct file *file, unsign=
ed long addr,
 		vma_iter_next_range(&vmi);
 	}

+	if (vms.end) {
+		vms_complete_munmap_vmas(&vms, &mas_detach);
+		vms.end =3D 0; // avoid double unmap below
+	}
+
 	/* Actually expand, if possible */
 	if (vma &&
 	    !vma_expand(&vmi, vma, merge_start, merge_end, vm_pgoff, next)) {
@@ -3026,7 +3031,8 @@ unsigned long mmap_region(struct file *file, unsigne=
d long addr,
 	if (vma =3D=3D prev)
 		vma_iter_set(&vmi, addr);
 cannot_expand:
-
+	if (vms.end)
+		vms_complete_munmap_vmas(&vms, &mas_detach);
 	/*
 	 * Determine the object being mapped and call the appropriate
 	 * specific mapper. the address has already been validated, but

The next patch move vms_complete_munmap_vmas() a little further beyond the
call to vma_expand(). This code contain the rss counter bug.

commit 02d6be2410fa503d008f4cc8dcd1518ca56f8793
Author: Bert Karwatzki <spasswolf@web.de>
Date:   Thu Jun 20 20:07:13 2024 +0200

    mm: mmap: push back vms_complete_munmap_vmas()

    This commit actually show the rss counter bug, while the previus does
    not!

    Signed-off-by: Bert Karwatzki <spasswolf@web.de>

diff --git a/mm/mmap.c b/mm/mmap.c
index 4fb9dd2e6d6e..c5f4b4b6fb84 100644
=2D-- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3016,14 +3016,12 @@ unsigned long mmap_region(struct file *file, unsig=
ned long addr,
 		vma_iter_next_range(&vmi);
 	}

-	if (vms.end) {
-		vms_complete_munmap_vmas(&vms, &mas_detach);
-		vms.end =3D 0; // avoid double unmap below
-	}
-
 	/* Actually expand, if possible */
 	if (vma &&
 	    !vma_expand(&vmi, vma, merge_start, merge_end, vm_pgoff, next)) {
+		if (vms.end) {
+			vms_complete_munmap_vmas(&vms, &mas_detach);
+		}
 		khugepaged_enter_vma(vma, vm_flags);
 		goto expanded;
 	}


So there might be some unwanted interaction between vms_complete_munmap_vm=
as though
I've no yet figured out what exactly is happening. Hope this will be helpf=
ul in
solving the problem.

Bert Karwatzki


