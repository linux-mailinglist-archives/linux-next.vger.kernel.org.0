Return-Path: <linux-next+bounces-2635-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C306912DDE
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 21:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D013E283269
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 19:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BE5168482;
	Fri, 21 Jun 2024 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="f/MHbmvk"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7372D84A32;
	Fri, 21 Jun 2024 19:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718998411; cv=none; b=KWPEt9XpclR02/NEOXWDs8fd0wE7s2r7rQqBkLUrfnrY5hCYDKI/5J+tPhqwsBUyWbIMkT7ALvU6IH8d/byPr3YFS9KEwgq/PjHKVdvMOVY3VelXWNZGcPaNFFr2dgXOUrJCZzc7iZELfj22tq+2lHySTpPXKCa52a2A16dvnHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718998411; c=relaxed/simple;
	bh=43rWBxFOy1IaWeBsSN18ZiL0vVYHQa8at9qTbLs2uQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6iAX8Ho9sPgKE+4M4NvlecVwIPBP8MXURaxtQDS6z7PP7EB1iAwl9I3i8mnYeF7KCT6yTTHYZwLr9sII4UZbGWMqm1duIys6brioJpKtRkgcU/80qNtZWAEvHw6PeWsoL9dTHa0OpX0dUTqF+9cDTckc/mHTs200smNZYjQfVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=f/MHbmvk; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718998395; x=1719603195; i=spasswolf@web.de;
	bh=aH971ZcYcuKRlw99KTDLXdXUre9wbPrQuEQ7oEy6AM4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=f/MHbmvk5g/AtI4dTq7o69zgSGL8+HI3qEE7outLEO4AE91qAWn+e5j8YxEaslzE
	 HhBYFB4LHCSzKmM9TkqDeTc50djCEExrQnFoTd/qae2phwxWhaYRmulR5E4saHPAC
	 cSaLxdKB3BZ4PiyQ62OziufOETZ+C6hg6ialIh02uB4Glk8wa6TS0eggSJ36T241I
	 K3NjB9PuT/S+0+EYolzOFT+Wd87x+f9Z4wceNi1acFhrTPTSNw/QSe6REA4sxVrZW
	 5bdsKvZd4rHuSATJPvlMvGQ4Hli9EbMCHfYU3ePMYdTXx0FDzju9t3+PIInW8FqMG
	 ZCHbVjmFnHrtQsiTTw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1M9ZZo-1sFDh919zo-00HQ4k; Fri, 21 Jun 2024 21:33:15 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jiri Olsa <olsajiri@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and firefox-esr crash in linux-next-20240613
Date: Fri, 21 Jun 2024 21:32:55 +0200
Message-ID: <20240621193259.109863-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: w5uejhiciolye2ikgsdjim25z7lau7km3tu6t2vby3kuxeshos@osowmu4ecng5
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S9KaBt8/2gMC/iMb6s2G8WTqV5bb7/8PnYVsFqY5WrWUs3PtHKL
 qdtfc96joa2niwanjCeZkHxG56Ii/fZE9+iwrWbdWc/Aq7Dw1CgwIXHh9GylUTAxtpzbx8D
 qX/QykEFonkdGoBQ5GZBAkZS0u9dFO9UW8NPX0gqYlGQ6jPh3aFFjyc6PeOkwrn+YLy9Iee
 OLhv0frIg2aL2anNmmLtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RzEmln3+sKw=;D9r2NW/MN3e4s4dMEttNXiaX5Ov
 rDYW+ABialMwu02YVpjUFKwBE5C+Sx55bPywJWVn3bIE3vBxRC7Z+hwx9omctbT0hocRNaUzx
 lIdsvjm7WIaYkl3b96KCLQx1tOX0aYOkSfLw4XVY4AbxZGiRXmbX8Es+H95L3siZAv61PaB/M
 +gq7X2i2nbJccCH17NGOxIYiQQRNNQvO0JPZ5iqIi0MGmJe6X2DOX6PPfb2sVS1siUegdW1OY
 AX8jVNj8LsQvKu1RKqE73m7MVDfqdzOSST0yAiVarjxa6U6qmZG6fmpZlS4lycVPXwBGazjVk
 eyk7VxPqpvCK5B3wVcK+dEAm74vA04hMh2HaUqqT+hkLAaPwrPLyDKKPbiz0bLVZvSNXpnTbA
 1gbGkHtDOwdPQXayNSN+AXmDoNPqqsXXz22/T5DBR2h3FbXvMi9NIlOhCfuFX+juSwyDAr7IF
 h6Wv/bEoaaHkZ7JQnJe/YF6mZCNUpA9oQdHmeNtJizjTRXL0rukKpliueiZSf8WgAlsDPDDQ8
 ZvTx8WlBkZU17Ktx+ST0LwahvVa/KQmNFZzkfNmf+eguxmnC19vT4yJOXuVo87LTfz4MwVjg0
 HpINWL5FjCUyIRxN3moT4DBkS4EZV/WwSYqOCj1zC1nyfil7RsyQBYz9NMPS2HHW6+tz1vGhZ
 FyyNrab/S93alO2Pp31FyXrFJ+biXOgI0OOVZRlcfLKoeKKe7ZkHPkbobB7Z8NOEXqyVOYU/D
 t3168vvIpW4yHFjksoxoxqvV2dN5B6Fs0MDrKsdj0IhBSDaewHNoMnlHtfO1AzuXCWQrbUse1
 1FKCw+qaAZDfxxFWghSDMr04u0kix7n3YXsp4xfj4ufnM=

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


