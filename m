Return-Path: <linux-next+bounces-1384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832A869B64
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 16:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB02282D93
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 15:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26422146000;
	Tue, 27 Feb 2024 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAeZZhVj"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F38145B19
	for <linux-next@vger.kernel.org>; Tue, 27 Feb 2024 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709049484; cv=none; b=bi2xuRSL5UgyF1uXvWP4N2yoxXSMDqFif7yes+29/KevUqfhZnrEco/RxMTboSwbfM6cYtuKhLqeBieX1Q1gnlOUOpAVygTRplSYtwsQufttnUMuUbXww+Ur97Q1A2uAEfIm28fAOmK9ACVRcVDeLaxe1cESneP/KBjj7pXKS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709049484; c=relaxed/simple;
	bh=m8atfW3nBIl+dzhdJpoKOIZ/gL0HTKVc5kaXGpcmAJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cr4VaElMLLDw6UrpoTCO0BYNTJjZIQCtJSdrH4WvuQ8e+9GkmI4VPsIcJ776oIZFkp+pBBn40Qs6gJb/YsZcFky0BSmDVkFibPiuAn/Yf+uSIaboRRC9uZrXnaUCAxAnnb3GG32aZeicMyQs7ebaBKnv5sc64BZRTRhyVFVVx70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAeZZhVj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709049481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fY+0b8Vv6KvNYU3uBxf+nKDNmKoZcXRJbPi/Ff45+Qo=;
	b=XAeZZhVjg45B3ZCF0QgPbCDXzbbWVakp4kx5ghcR+o1jFGqfbFS+6BHvwRUFAFFOkwGYzc
	/fQ7utz43XDFbds/VXc1ktn80V+8zdNYlmgXJSCe9x1SpPagvDRcO5zHdh3XOW6+/im8ZW
	3WPVJMH3emitJeVFfdsaQqS3icZ5MjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-mf7YYoOkNZqLArlp8yPSFA-1; Tue, 27 Feb 2024 10:57:59 -0500
X-MC-Unique: mf7YYoOkNZqLArlp8yPSFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADC7585A589;
	Tue, 27 Feb 2024 15:57:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D3C81C060B1;
	Tue, 27 Feb 2024 15:57:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] virtiofs: drop __exit from virtio_fs_sysfs_exit()
Date: Tue, 27 Feb 2024 10:57:56 -0500
Message-ID: <20240227155756.420944-1-stefanha@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

virtio_fs_sysfs_exit() is called by:
- static int __init virtio_fs_init(void)
- static void __exit virtio_fs_exit(void)

Remove __exit from virtio_fs_sysfs_exit() since virtio_fs_init() is not
an __exit function.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402270649.GYjNX0yw-lkp@intel.com/
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 fs/fuse/virtio_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 62a44603740c..948b49c2460d 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1588,7 +1588,7 @@ static int __init virtio_fs_sysfs_init(void)
 	return 0;
 }
 
-static void __exit virtio_fs_sysfs_exit(void)
+static void virtio_fs_sysfs_exit(void)
 {
 	kset_unregister(virtio_fs_kset);
 	virtio_fs_kset = NULL;
-- 
2.43.2


