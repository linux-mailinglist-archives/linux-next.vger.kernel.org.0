Return-Path: <linux-next+bounces-4371-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811A9AA1A4
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4061F22A2F
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 12:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D623C155352;
	Tue, 22 Oct 2024 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Kn2KVEzW"
X-Original-To: linux-next@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152B4199252;
	Tue, 22 Oct 2024 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729598491; cv=none; b=HWMVh0CaNqbCuvjPwFMjZn7s8qMT2ujOHPSqEvGyeawZZ+TqIFg7KgfKcshhW9bj12zrmS7r88w5LKKsY2tUX2Cn1GJLVgtYyIa4Lc+FJIxaYqYJphxNxDifCadG/0AA2CB+CuaurzaJ/10Ua+gb0ibS7Mw2qDqKKlE4V9BOZ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729598491; c=relaxed/simple;
	bh=k6koRQgSHK/ZNH8Ty7VRJhVnKM9k4p+iL9PJorNpbTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eS7pGY+dJEEQX2UrnPFU+3QlKFUCfk/rhY1yH2epz4r2DawMPV+iJlQy09KPtDRVcLF90R6INA2H5jz3OgM24Ge1S4uZPRanH5dVe1j1GS6xnj6tczOkpvDusK08SpxH3/WTwBXNloKZPvE9GrPCh54JQaVFHu34ge7FAkkbLWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Kn2KVEzW; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IEXNG0vacfLWhp9t0Eb7rxFemcKHJ2LyE/rOALbSK48=;
	b=Kn2KVEzWNrF3CrE0Si7TEmb3dqv7iR8lR64kj1ioZ0Cls7hfayj0jea/mHJevF
	cFCTCHJhA0r69qyOr6S1quKWO2tCB+lFsCAWP7+KXwi8+UXzhByDMrvpx2GqtWYY
	6R8rLaEB3GQ4qu7T3PvNGBC3bPO0oewqNG4BbVlq2UfB0=
Received: from localhost (unknown [36.33.37.152])
	by gzsmtp3 (Coremail) with SMTP id sigvCgDn+CPmkxdn2T3yBA--.44759S2;
	Tue, 22 Oct 2024 20:00:38 +0800 (CST)
Date: Tue, 22 Oct 2024 20:00:38 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Steven Whitehouse <swhiteho@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next@vger.kernel.org
Subject: [PATCH v2] KMSAN: uninit-value in inode_go_dump (5)
Message-ID: <ZxeT5ig2gOAUC7V4@fedora>
References: <20241022075004.3369d8ec@canb.auug.org.au>
 <F1F8682B-9B60-4674-BF91-ADD15A429F1D@163.com>
 <CAHc6FU4DEhijmGR+Fc-RiOeg59sO1t=XnsqmeArQmssOXfDjgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU4DEhijmGR+Fc-RiOeg59sO1t=XnsqmeArQmssOXfDjgg@mail.gmail.com>
X-CM-TRANSID:sigvCgDn+CPmkxdn2T3yBA--.44759S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7AFWDtry8JF1UurWktFb_yoWDurc_Ga
	1fXw4xu3yDAr10kw1UGFsxJrsag397ZF1xC3yUtFn8tr1jv3WDXF4DAwn3CFnI9rsxKr43
	Jry5Wa10k34UWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbAR63UUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiYB2AamcXhmzkKQAAsA

When mounting of a corrupted disk image fails, the error message printed
can reference uninitialized inode fields.  To prevent that from happening,
always initialize those fields.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
Reported-by: syzbot+aa0730b0a42646eb1359@syzkaller.appspotmail.com
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 Changes since v1:
 - Add Signed-off-by tag
---
 fs/gfs2/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 23e3a85ab7ef..aadb83e38c17 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1553,11 +1553,13 @@ static struct inode *gfs2_alloc_inode(struct super_block *sb)
 	if (!ip)
 		return NULL;
 	ip->i_no_addr = 0;
+	ip->i_no_formal_ino = 0;
 	ip->i_flags = 0;
 	ip->i_gl = NULL;
 	gfs2_holder_mark_uninitialized(&ip->i_iopen_gh);
 	memset(&ip->i_res, 0, sizeof(ip->i_res));
 	RB_CLEAR_NODE(&ip->i_res.rs_node);
+	ip->i_diskflags = 0;
 	ip->i_rahead = 0;
 	return &ip->i_inode;
 }
-- 
2.47.0


