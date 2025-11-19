Return-Path: <linux-next+bounces-9092-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A9C7176A
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0EB1E29036
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 23:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D78B288C0E;
	Wed, 19 Nov 2025 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Zpcwt6Hw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C13827D782;
	Wed, 19 Nov 2025 23:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763596106; cv=none; b=SLZOLXklxYGXNCB+Z8z2X/28aEIerGlSuHT5EgHhGd4sBc63Bbk02fL+PeyPSR/aqaQvc97flWf9YxMRg5Ieqz1FLBnOoqa6JPK8efKCCK5f4J4FBegpDN882bSGnuPOSXIp9iVkVOs7mEuciJPcCHDnUYPTlsBXhNO4pYjv87s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763596106; c=relaxed/simple;
	bh=kcB10xuwy6prgtlJYijHvQZ0dP+Kci0qMXEkPYZrtX4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=siOdxauyaUSWFW+SjQBxyncuSAu1CRjnsvgLGzDzIsJhJxB4q2M8lDOmhC48kA5YR1IZK1y8NAD/2Q6uSwFrNbcBYWY6uHpTStllxQes/0jRmS9NZlykUXnwj2qGvF1Y6SurbX15igl22xDKvBBRmt4hSJa+ZvaGurkk2iaGsE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Zpcwt6Hw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690BBC4CEF5;
	Wed, 19 Nov 2025 23:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1763596105;
	bh=kcB10xuwy6prgtlJYijHvQZ0dP+Kci0qMXEkPYZrtX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zpcwt6Hw9ujzySz+pCN0W1LaT5CxFTORS5yljGKV2NMHAdF/CNAIOrNzfRSP05Rth
	 nF6ADBSzpAB+dkbk9qQkmJmVWCeYpYxrabHmzHNjJNGoQNuHCaMrrCyD6Aw3iaUa0W
	 HbpRMRrJRi6fvSSbh6J2lSfdTqENjUqXKCjBci3c=
Date: Wed, 19 Nov 2025 15:48:24 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Dumazet <edumazet@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Wedson
 Almeida Filho <wedsonaf@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
Message-Id: <20251119154824.339bfbeb47d149b041f15550@linux-foundation.org>
In-Reply-To: <20251120101440.0f41ca9b@canb.auug.org.au>
References: <20251117102310.58ecfdb4@canb.auug.org.au>
	<20251120101440.0f41ca9b@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Nov 2025 10:14:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Mon, 17 Nov 2025 10:23:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the mm-nonmm-unstable tree, today's linux-next build
> > (x86_64 allmodconfig) failed like this:
> > 
> > error[E0425]: cannot find function `rb_first` in crate `bindings`
> >    --> rust/kernel/rbtree.rs:209:42  
> >     |
> > 209 |                 next: unsafe { bindings::rb_first(&self.root) },
> >     |                                          ^^^^^^^^ not found in `bindings`
> > 
> > error[E0425]: cannot find function `rb_first` in crate `bindings`
> >    --> rust/kernel/rbtree.rs:224:42  
> >     |
> > 224 |                 next: unsafe { bindings::rb_first(from_mut(&mut self.root)) },
> >     |                                          ^^^^^^^^ not found in `bindings`
> > 
> > error[E0425]: cannot find function `rb_first` in crate `bindings`
> >    --> rust/kernel/rbtree.rs:249:42  
> >     |
> > 249 |         let current = unsafe { bindings::rb_first(root) };
> >     |                                          ^^^^^^^^ not found in `bindings`
> > 
> > error[E0425]: cannot find function `rb_last` in crate `bindings`
> >      --> rust/kernel/rbtree.rs:264:42  
> >       |
> > 264   |         let current = unsafe { bindings::rb_last(root) };
> >       |                                          ^^^^^^^ help: a function with a similar name exists: `sg_last`
> >       |
> >      ::: rust/bindings/bindings_generated.rs:90155:5
> >       |
> > 90155 |     pub fn sg_last(s: *mut scatterlist, arg1: ffi::c_uint) -> *mut scatterlist;
> >       |     --------------------------------------------------------------------------- similarly named function `sg_last` defined here
> > 
> > error: aborting due to 4 previous errors
> > 
> > For more information about this error, try `rustc --explain E0425`.
> > 
> > Caused by commit
> > 
> >   84aa8c5fc414 ("rbtree: inline rb_first()")
> > 
> > I have reverted that commit and the following one for today.
> 
> I am still reverting those commits.

Thanks, I'll disable them for now.

Alice, can you please help us with a fix?  Simple patch follows:



--- a/include/linux/rbtree.h~rbtree-inline-rb_first
+++ a/include/linux/rbtree.h
@@ -43,7 +43,21 @@ extern void rb_erase(struct rb_node *, s
 /* Find logical next and previous nodes in a tree */
 extern struct rb_node *rb_next(const struct rb_node *);
 extern struct rb_node *rb_prev(const struct rb_node *);
-extern struct rb_node *rb_first(const struct rb_root *);
+
+/*
+ * This function returns the first node (in sort order) of the tree.
+ */
+static inline struct rb_node *rb_first(const struct rb_root *root)
+{
+	struct rb_node	*n;
+
+	n = root->rb_node;
+	if (!n)
+		return NULL;
+	while (n->rb_left)
+		n = n->rb_left;
+	return n;
+}
 extern struct rb_node *rb_last(const struct rb_root *);
 
 /* Postorder iteration - always visit the parent after its children */
--- a/lib/rbtree.c~rbtree-inline-rb_first
+++ a/lib/rbtree.c
@@ -460,22 +460,6 @@ void __rb_insert_augmented(struct rb_nod
 }
 EXPORT_SYMBOL(__rb_insert_augmented);
 
-/*
- * This function returns the first node (in sort order) of the tree.
- */
-struct rb_node *rb_first(const struct rb_root *root)
-{
-	struct rb_node	*n;
-
-	n = root->rb_node;
-	if (!n)
-		return NULL;
-	while (n->rb_left)
-		n = n->rb_left;
-	return n;
-}
-EXPORT_SYMBOL(rb_first);
-
 struct rb_node *rb_last(const struct rb_root *root)
 {
 	struct rb_node	*n;
_


