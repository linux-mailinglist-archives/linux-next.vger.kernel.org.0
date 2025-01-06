Return-Path: <linux-next+bounces-5056-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB575A0270B
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 14:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E368163557
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 13:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936C828F5;
	Mon,  6 Jan 2025 13:48:13 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEFF79C4
	for <linux-next@vger.kernel.org>; Mon,  6 Jan 2025 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171293; cv=none; b=GNupDktnvruiltuQgq8BNWuvZ+8QetVShacOyl3ZjO6lI++IpYdU4HOilFA/C+tpB9y3UeEpzmsK3GGaNUJ3Vs5x/k1qjwcLBCi2V0D+bDltg1G87O4bzyd6OG+YKFExAjbVieQgiUHV8ZrMJwKscLjB56T6jipdPzDtJuWze0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171293; c=relaxed/simple;
	bh=/BRwXKdY7yeFklQ4rce9sVCcAy4drJJC1/e90n1Dgjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LOwMtk5GbKfNsp1A9Qy4JfyFs4lp68zV50dkZbbSSsCD6u+qHZNhocxbGJEk2qMjX8wY8guLyU3EA4nnS2z9Fv9aif25/zF5PmnXMQN4QWMWnLJUQzPxOLul+M9In2ZFBXjOxTUTvbEh0BzL6eJLVmL5bi4FCplIUpkgBhATRts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by xavier.telenet-ops.be with cmsmtp
	id xpo32D0053AZZFy01po3C3; Mon, 06 Jan 2025 14:48:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUnSa-00000008JLG-1NZm;
	Mon, 06 Jan 2025 14:48:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUnSc-00000004HKO-40Hn;
	Mon, 06 Jan 2025 14:48:02 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH -next] samples/vfs/mountinfo: Use __u64 instead of uint64_t
Date: Mon,  6 Jan 2025 14:48:01 +0100
Message-ID: <20250106134802.1019911-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 32-bit (e.g. arm32, m68k):

    samples/vfs/mountinfo.c: In function ‘dump_mountinfo’:
    samples/vfs/mountinfo.c:145:29: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      145 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
	  |                           ~~^                 ~~~~~~~~~
	  |                             |                 |
	  |                             long unsigned int uint64_t {aka long long unsigned int}
	  |                           %llx
    samples/vfs/mountinfo.c:145:35: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      145 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
	  |                                 ~~^                      ~~~~~~
	  |                                   |                      |
	  |                                   long unsigned int      uint64_t {aka long long unsigned int}
	  |                                 %llx

Just using "%llx" instead of "%lx" is not sufficient, as uint64_t is
"long unsigned int" on some 64-bit platforms like arm64.  Hence also
replace "uint64_t" by "__u64", which matches what most other samples
are already using.

Fixes: d95e49bf8bcdc7c1 ("samples: add a mountinfo program to demonstrate statmount()/listmount()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Feel free to fold into the original commit.

Alternatively, you can use PRIx64, which is used by tools/, but not by
any of the current samples.
---
 samples/vfs/mountinfo.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/samples/vfs/mountinfo.c b/samples/vfs/mountinfo.c
index 2b17d244d321ee75..f47c035cc339544e 100644
--- a/samples/vfs/mountinfo.c
+++ b/samples/vfs/mountinfo.c
@@ -32,9 +32,9 @@ static bool ext_format;
  * There are no bindings in glibc for listmount() and statmount() (yet),
  * make our own here.
  */
-static int statmount(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask,
-			    struct statmount *buf, size_t bufsize,
-			    unsigned int flags)
+static int statmount(__u64 mnt_id, __u64 mnt_ns_id, __u64 mask,
+		     struct statmount *buf, size_t bufsize,
+		     unsigned int flags)
 {
 	struct mnt_id_req req = {
 		.size = MNT_ID_REQ_SIZE_VER0,
@@ -50,9 +50,8 @@ static int statmount(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask,
 	return syscall(__NR_statmount, &req, buf, bufsize, flags);
 }
 
-static ssize_t listmount(uint64_t mnt_id, uint64_t mnt_ns_id,
-			 uint64_t last_mnt_id, uint64_t list[], size_t num,
-			 unsigned int flags)
+static ssize_t listmount(__u64 mnt_id, __u64 mnt_ns_id, __u64 last_mnt_id,
+			 __u64 list[], size_t num, unsigned int flags)
 {
 	struct mnt_id_req req = {
 		.size = MNT_ID_REQ_SIZE_VER0,
@@ -68,7 +67,7 @@ static ssize_t listmount(uint64_t mnt_id, uint64_t mnt_ns_id,
 	return syscall(__NR_listmount, &req, list, num, flags);
 }
 
-static void show_mnt_attrs(uint64_t flags)
+static void show_mnt_attrs(__u64 flags)
 {
 	printf("%s", flags & MOUNT_ATTR_RDONLY ? "ro" : "rw");
 
@@ -112,7 +111,7 @@ static void show_propagation(struct statmount *sm)
 		printf(" unbindable");
 }
 
-static void show_sb_flags(uint64_t flags)
+static void show_sb_flags(__u64 flags)
 {
 	printf("%s", flags & MS_RDONLY ? "ro" : "rw");
 	if (flags & MS_SYNCHRONOUS)
@@ -125,15 +124,15 @@ static void show_sb_flags(uint64_t flags)
 		printf(",lazytime");
 }
 
-static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
+static int dump_mountinfo(__u64 mnt_id, __u64 mnt_ns_id)
 {
 	int ret;
 	struct statmount *buf = alloca(STATMOUNT_BUFSIZE);
-	const uint64_t mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
-				STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
-				STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
-				STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
-				STATMOUNT_SB_SOURCE;
+	const __u64 mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
+			   STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
+			   STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
+			   STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
+			   STATMOUNT_SB_SOURCE;
 
 	ret = statmount(mnt_id, mnt_ns_id, mask, buf, STATMOUNT_BUFSIZE, 0);
 	if (ret < 0) {
@@ -142,7 +141,7 @@ static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
 	}
 
 	if (ext_format)
-		printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
+		printf("0x%llx 0x%llx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
 
 	printf("%u %u %u:%u %s %s ", buf->mnt_id_old, buf->mnt_parent_id_old,
 				   buf->sb_dev_major, buf->sb_dev_minor,
@@ -166,10 +165,10 @@ static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
 	return 0;
 }
 
-static int dump_mounts(uint64_t mnt_ns_id)
+static int dump_mounts(__u64 mnt_ns_id)
 {
-	uint64_t mntid[MAXMOUNTS];
-	uint64_t last_mnt_id = 0;
+	__u64 mntid[MAXMOUNTS];
+	__u64 last_mnt_id = 0;
 	ssize_t count;
 	int i;
 
-- 
2.43.0


