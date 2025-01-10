Return-Path: <linux-next+bounces-5147-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B8A08ED5
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 12:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F03017A2A6B
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331F9209F32;
	Fri, 10 Jan 2025 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0kjedv7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093BB20550A;
	Fri, 10 Jan 2025 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507335; cv=none; b=g8MFYOSnjilos9n3i3SLFNJOlpp+r7WMmwmFDcsgWSGx4M9cdc3xY4oBCnJAm09Rp9mP6BAtSmmDw8oVIWNbbriSSL2QKIGij8YO8AXWXto4ZPSVDwhLqXkOkNzFYz30aGWQlx00H4K7gpl3SNXW7oc4r+JpaBYK/3ehACby4FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507335; c=relaxed/simple;
	bh=HV0C/PdaseQ4DsT3b/AlZH7TSiFjh0bVZ6UY2lBbR5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=egUPAlmFIHL8IRfoYvKsMQ0mjpE0Yk45ddxWyU+WKFPQDKC0C0xBwR7iPGl5b5ZuthIj4lD5rGAakhqfiXEJnw8r99pFRHMEl60UjUNxyJ31G6n48bwhi7D4qylBegQNyM+jUIfwyLVRHa9qXpaI+zazDtg/dy2f97TTKQKgJBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0kjedv7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1F6C4CED6;
	Fri, 10 Jan 2025 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736507334;
	bh=HV0C/PdaseQ4DsT3b/AlZH7TSiFjh0bVZ6UY2lBbR5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0kjedv7bGLxZaS4wBQ6jLghHAx1ybyHeRKw0yvBvPdvZkDa1K4CCTEen4lPk9Zbm
	 1fJzVwbIQ7PbbnKkQU0WXnKovj2dL+jFA2Gbj2qudj6kR3Ijhp3sdBsAoVD49+IoYA
	 8tRq3hgc5yUXuPC217RNFR3l43JutYq3V1E/Zpu8MlsDVEmQj0CwD2kyEcrsKiSVsX
	 +RQ/LDoZz2m+hOeGPEh1lWxuV83SGmOwV36uZ6Ahbx1kYvrGKU0iOixbnaAxEHQWCC
	 YyqPI9Qveog3xkXTMvW5LXjzcNSMKRQk5QP8nKqQjnzny778ncKYHBZYfVBwsOungp
	 TENS4VyFokgtA==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] samples/vfs/mountinfo: Use __u64 instead of uint64_t
Date: Fri, 10 Jan 2025 12:08:47 +0100
Message-ID: <20250110-genom-jagdsaison-02d05f945840@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106134802.1019911-1-geert+renesas@glider.be>
References: <20250106134802.1019911-1-geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103; i=brauner@kernel.org; h=from:subject:message-id; bh=HV0C/PdaseQ4DsT3b/AlZH7TSiFjh0bVZ6UY2lBbR5A=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQ3/D/Q9yRJJF94/gVRhgX7xdm5tjQs+7PMcbPvXS+/9 4JqHz8e6ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhI5RtGhpct3U4xf88mT3l9 w/RCAHft0TPP2NUV9j+e0c9SNynvIjsjw/1ih3Mt6x1ePD60Rcfsz7qDr+0KhVlTVzf5e8U7l9m e5AMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Mon, 06 Jan 2025 14:48:01 +0100, Geert Uytterhoeven wrote:
> On 32-bit (e.g. arm32, m68k):
> 
>     samples/vfs/mountinfo.c: In function ‘dump_mountinfo’:
>     samples/vfs/mountinfo.c:145:29: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>       145 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
> 	  |                           ~~^                 ~~~~~~~~~
> 	  |                             |                 |
> 	  |                             long unsigned int uint64_t {aka long long unsigned int}
> 	  |                           %llx
>     samples/vfs/mountinfo.c:145:35: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>       145 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
> 	  |                                 ~~^                      ~~~~~~
> 	  |                                   |                      |
> 	  |                                   long unsigned int      uint64_t {aka long long unsigned int}
> 	  |                                 %llx
> 
> [...]

Applied to the vfs-6.14.mount branch of the vfs/vfs.git tree.
Patches in the vfs-6.14.mount branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.14.mount

[1/1] samples/vfs/mountinfo: Use __u64 instead of uint64_t
      https://git.kernel.org/vfs/vfs/c/f79e6eb84d4d

