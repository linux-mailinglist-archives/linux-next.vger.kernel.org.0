Return-Path: <linux-next+bounces-9470-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2222ECCBC1C
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 13:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EE25305EC0D
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 12:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8983164CB;
	Thu, 18 Dec 2025 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WjLmiFJF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="xzM/NkYz";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WjLmiFJF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="xzM/NkYz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA212882A1
	for <linux-next@vger.kernel.org>; Thu, 18 Dec 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766060067; cv=none; b=lYl2ZECl8Bn7z5a2FpmWYJBgu8Gc/e0yDgR3xg6s1VW72SKNRdxnlwBNhZaYszxV2lndDi+UwWOQQfvbH34M5JoQKXkNnZXUOSvvFdIbH4LDSDB9SIPVymDyG/z/y1FsaRSHv8zJDenpzRKSny8vVc+1S7LiRRPDh4ZPg5E6cmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766060067; c=relaxed/simple;
	bh=tmfhnUQzMXF7Q6ItWWEe7rmGPig1ZtndBavG3ym1mmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNsLVV1bznBrunbIsl1PTD1dUxAGac2msJX29WrZZv3em7T2W1ddbt+YnZt0j7K2uDxC6CjqdR7o6TDM2JKBslmIDJQ+FMHBie8eNLU3QGl+EQjGbIVcdobRwS0gtFKpY+HBmoTCOCTuYpXvmj95B8Du2t1lx54zhm4mY56KHvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=WjLmiFJF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=xzM/NkYz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=WjLmiFJF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=xzM/NkYz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 586F633728;
	Thu, 18 Dec 2025 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1766060064;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XGCJBpxaZYvuudisidLZME7cL5v4TpntmbaINQirT2M=;
	b=WjLmiFJFXIUM7cruTuc/jXpNje2lE8KiO7sZbCBTHYtpDhl6PSUcf2/FFLYuA4Ip6SdLm0
	vsqM2fLhUbxRu+jOPKuH875PG5xO1XwW5f3P+MPmfrwZ6ECwYMPsISNb9qaOwtyIwnWdVm
	WssPIV28r7PlBy2fbCZ1DRWr087H808=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1766060064;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XGCJBpxaZYvuudisidLZME7cL5v4TpntmbaINQirT2M=;
	b=xzM/NkYzV44MTvvuaVGG/KU+AbmPTuhYYHMmfvp9xvLt0NRJbnF+GatTQ4tKNZr/nc2oaC
	1gEQW24YrEZJ6kDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1766060064;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XGCJBpxaZYvuudisidLZME7cL5v4TpntmbaINQirT2M=;
	b=WjLmiFJFXIUM7cruTuc/jXpNje2lE8KiO7sZbCBTHYtpDhl6PSUcf2/FFLYuA4Ip6SdLm0
	vsqM2fLhUbxRu+jOPKuH875PG5xO1XwW5f3P+MPmfrwZ6ECwYMPsISNb9qaOwtyIwnWdVm
	WssPIV28r7PlBy2fbCZ1DRWr087H808=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1766060064;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XGCJBpxaZYvuudisidLZME7cL5v4TpntmbaINQirT2M=;
	b=xzM/NkYzV44MTvvuaVGG/KU+AbmPTuhYYHMmfvp9xvLt0NRJbnF+GatTQ4tKNZr/nc2oaC
	1gEQW24YrEZJ6kDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 469CA3EA63;
	Thu, 18 Dec 2025 12:14:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TPW0ECDwQ2mzbwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 18 Dec 2025 12:14:24 +0000
Date: Thu, 18 Dec 2025 13:14:22 +0100
From: David Sterba <dsterba@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20251218121422.GM3195@suse.cz>
Reply-To: dsterba@suse.cz
References: <20251218092655.4fe4165c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218092655.4fe4165c@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-3.96 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.16)[-0.818];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.96

On Thu, Dec 18, 2025 at 09:26:55AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the btrfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from fs/btrfs/disk-io.h:12,
>                  from fs/btrfs/super.c:34:
> fs/btrfs/bio.h:100:14: error: duplicate member 'can_use_append'
>   100 |         bool can_use_append;
>       |              ^~~~~~~~~~~~~~
> 
> (and several others similar)
> 
> Caused by commits
> 
>   a9e53c29f361 ("btrfs: shrink the size of btrfs_bio")
>   009334649b08 ("btrfs: zoned: don't zone append to conventional zone")
> 
> interacting with commit
> 
>   ad93f92010a1 ("btrfs: zoned: don't zone append to conventional zone")
> 
> from the btrfs-fixes tree.
> 
> I applied the following merge fix patch for today, but please clean up
> your trees.

Thanks, I'd fixed the build failure locally but forgot to push the
updated branch. It'll be fixed in todays for-next snapshot.

