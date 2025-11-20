Return-Path: <linux-next+bounces-9107-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D3281C72FEB
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 09:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5880E357FAA
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 08:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197E21A4F3C;
	Thu, 20 Nov 2025 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hb7mbqA5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513D78F54;
	Thu, 20 Nov 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628942; cv=none; b=ow+YaBzT36QbRce6PlFNHhU5VdIG0kj3Sv8+SZgk2E42CeZuOs6Q+e3RRyniVw1x9Y8UcGkHdau1E7WttTFKkMezhYxTdfKsv0o3ZaTs9jB5pJGfZIb6AShP/iHbWyVPoPuhlFKGhn7kno5lH2GSlQeX87uMxf9E0yqj1DqEsJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628942; c=relaxed/simple;
	bh=AkM6xJMDRnf3ThMPknXOcWuEiew/kHlyo3QWaw+4KFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fauiMKoqkIZvY5opftkAKy4yDiLgo1ffvYTnWXmvYG9gS7WHzfHwBlIjvY4EKJtMqMCU3fW/oKIK5qGVJKW80mu5nMiOZhPqX/aJx4Vp9Dsz7bjdpFrPE/LAfEt/byQvsgeLVScOWBZ8icaQUbXRwMyeK1YX8Zsz6vQIkhB2gTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hb7mbqA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB71AC4CEF1;
	Thu, 20 Nov 2025 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763628941;
	bh=AkM6xJMDRnf3ThMPknXOcWuEiew/kHlyo3QWaw+4KFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hb7mbqA5tTVMAO2puG4QvUBI1uIL6QTK8tfs0Vn7z50IIAaMJzHhZHh3UuG2wtxll
	 0cWv1qOqVijJYyDaZRNI0XNY431v33+NXg6ls0clCNExvydAU49pMR3nFekKaLSsgn
	 VaAJYQ91LbbvgEy8gHmQCT5aXPP5vdW+IGDWUNt+r+3ox8/3CF67m6MDEVSD4WKI11
	 QDOGzVL0iteIPYf+Hv2nkhGwnvj6p309+p9s9ziDb03GH1Tm7XzUwZgxm6Na5YtD4d
	 MLdJ8duKb/SbzuMsy8FrinRcIE8m1Ozub5gHuaR2iBKUo5OVgiAc0z/ycgyzkC3PEG
	 ipMZTWGXwqPNw==
From: Miguel Ojeda <ojeda@kernel.org>
To: akpm@linux-foundation.org
Cc: aliceryhl@google.com,
	edumazet@google.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	ojeda@kernel.org,
	sfr@canb.auug.org.au,
	wedsonaf@gmail.com
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable tree
Date: Thu, 20 Nov 2025 09:55:18 +0100
Message-ID: <20251120085518.1463498-1-ojeda@kernel.org>
In-Reply-To: <20251119154824.339bfbeb47d149b041f15550@linux-foundation.org>
References: <20251119154824.339bfbeb47d149b041f15550@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 19 Nov 2025 15:48:24 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> Thanks, I'll disable them for now.
>
> Alice, can you please help us with a fix?  Simple patch follows:

Something like this should work (I would suggest adding each helper into
the right commit that performs each move to the header):

diff --git a/rust/helpers/rbtree.c b/rust/helpers/rbtree.c
index 6d404b84a9b5..2a0eabbb4160 100644
--- a/rust/helpers/rbtree.c
+++ b/rust/helpers/rbtree.c
@@ -7,3 +7,13 @@ void rust_helper_rb_link_node(struct rb_node *node, struct rb_node *parent,
 {
        rb_link_node(node, parent, rb_link);
 }
+
+struct rb_node *rust_helper_rb_first(const struct rb_root *root)
+{
+       return rb_first(root);
+}
+
+struct rb_node *rust_helper_rb_last(const struct rb_root *root)
+{
+       return rb_last(root);
+}

Cheers,
Miguel

