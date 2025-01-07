Return-Path: <linux-next+bounces-5069-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC54A03510
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 03:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BE44188669E
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 02:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355D0198A08;
	Tue,  7 Jan 2025 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="q6puSjG/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05928157A5A;
	Tue,  7 Jan 2025 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736216406; cv=none; b=JGYDDWrO0UHuf5bdYvhgnqM/Gj992Z+sQ7FA4V9U0qGNs5vvy/dQqfVdVQ1Mc2e/LcRXJLSO3OYKMmsivXOVBC/nmScLeMMM82mdwj+67kC7npnc50IHGDn5mP3QVg8QBIn8QMdX2efyGBXqnzuFrNiMZ+C3+ibjFJSK77BZQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736216406; c=relaxed/simple;
	bh=Aq5TjpSQ6Vv0a+ItZItZ6FJ8j0eF9lskGeY1DRk+9EY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GZXhlWM0nQoX9HDSmk8hhl87S1S1QHGiF0onrFkz2bc9aw+zsVtHP+SOnJ7E8fLbiOrm8azwIAKzWUC86DzIi2yJhFMs+KTcYVSD98dQASd2HK2fD1vSLPRGkQcMnmcIMFQwd0qXeidoHQV35ULuiQAZsKSkC4mvXQdAKG8ybpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=q6puSjG/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E140C4CEDD;
	Tue,  7 Jan 2025 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736216405;
	bh=Aq5TjpSQ6Vv0a+ItZItZ6FJ8j0eF9lskGeY1DRk+9EY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q6puSjG/VJF/53pNbPrU8WFxopEbE+kab5fqK1JuP3hUwQeDOKhEpLEk7WRv/P62C
	 HtXpM3NHGY+Cmf/LgqRZopmGLe22pOGppr1a7DZsh2k2+kf9wtLPbtx9K/7El5s2Tx
	 Ex0Rh0DyYvnJ4QTJP8ejplFKKGXAXsBuQJeCyGTc=
Date: Mon, 6 Jan 2025 18:20:04 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the mm tree
Message-Id: <20250106182004.284b2049753a886039015074@linux-foundation.org>
In-Reply-To: <87o70kt232.fsf@trenco.lwn.net>
References: <20250106095826.140c01cb@canb.auug.org.au>
	<87o70kt232.fsf@trenco.lwn.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 06 Jan 2025 08:05:21 -0700 Jonathan Corbet <corbet@lwn.net> wrote:

> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@@ -3237,12 -3237,12 +3237,12 @@@ sub process 
> >   			my ($cid, $ctitle) = git_commit_info($orig_commit, $id,
> >   							     $title);
> >   
> >  -			if ($ctitle ne $title || $tag_case || $tag_space ||
> >  -			    $id_length || $id_case || !$title_has_quotes) {
> >  +			if (defined($cid) && ($ctitle ne $title || $tag_case || $tag_space || $id_length || $id_case || !$title_has_quotes)) {
> >  +				my $fixed = "Fixes: $cid (\"$ctitle\")";
> >   				if (WARN("BAD_FIXES_TAG",
> > - 				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
> >  -				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
> > ++				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
> 
> ...it all comes down to a single "+" sign here.  If 253f01394dc0 could
> be tweaked to add that character, I think this conflict would go away
> and we wouldn't make Linus delve into Perl code...?

Sure, I added this:

--- a/scripts/checkpatch.pl~checkpatch-check-return-of-git_commit_info-fix
+++ a/scripts/checkpatch.pl
@@ -3240,7 +3240,7 @@ sub process {
 			if (defined($cid) && ($ctitle ne $title || $tag_case || $tag_space || $id_length || $id_case || !$title_has_quotes)) {
 				my $fixed = "Fixes: $cid (\"$ctitle\")";
 				if (WARN("BAD_FIXES_TAG",
-				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
+				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
 				    $fix) {
 					$fixed[$fixlinenr] = $fixed;
 				}
_


