Return-Path: <linux-next+bounces-4528-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68E9B4F2E
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 17:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FDDC1F23D57
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 16:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5831198E99;
	Tue, 29 Oct 2024 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JwJxRGHk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="GVN5C4Fp";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JwJxRGHk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="GVN5C4Fp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40815198A35;
	Tue, 29 Oct 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218917; cv=none; b=kh3syV9VrQnMPdZ8MPUQKo7KRub6+HnK/jbS/HHceUNLmcZkDUghjHa0+F7AXcmmBN09bnq25uin0g/wsdV1OB0DLxIccZ/Il5KNwRgqEhjozoBOV2yKdjcY75dQCAHRYg8NSSjBqUwDnyn7KuY8AkMkB2chDs9j270RwFSbvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218917; c=relaxed/simple;
	bh=WsW21hD72kzIia5+FTxrUAYT4LUgXH1j5s1zShs8+oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH9VyJw8QcF7snrNSurbxd9lT6sRj5RHlcZLbEB8Yw4mXO2vMDMuD1XEUkBz+h4m0qwxaoh8nlrjV6glsxzWklZNAeD3AM86eZTaKkofK5K8dD+OE+LHdG6ce2OZRvnlExn9ePKagNjPW2FxVBRumSKRhM4Xrs+hMFnNnoI4dlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JwJxRGHk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=GVN5C4Fp; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JwJxRGHk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=GVN5C4Fp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C0E01F798;
	Tue, 29 Oct 2024 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1730218913;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nenyWvL0p0mgXQsAwqZGu4dLidfX8h1SUUHlj8B0OKU=;
	b=JwJxRGHkOmiB56F+NhmSNgqBNplHCUwBSje0yA7mHtbQc3kKg5h2yf719yn8Z2mERuEhpe
	cUl7MFCLU8dScdwTa7wO6hQDuWXnK3afKSFgHmnvtWn3kTVKew/78qD9tFVXOzRnY5+Nq6
	D73LiyzgpqVIWFAYg4XNEwM4uPJPb78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1730218913;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nenyWvL0p0mgXQsAwqZGu4dLidfX8h1SUUHlj8B0OKU=;
	b=GVN5C4FpXnVXhR3pWESUlNk1JgGV3vcnPgvhCa3UMpIBLaR8XgJv7q1JRb83/PRuiputK6
	0VW2p9MXPXj0eHBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=JwJxRGHk;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=GVN5C4Fp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1730218913;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nenyWvL0p0mgXQsAwqZGu4dLidfX8h1SUUHlj8B0OKU=;
	b=JwJxRGHkOmiB56F+NhmSNgqBNplHCUwBSje0yA7mHtbQc3kKg5h2yf719yn8Z2mERuEhpe
	cUl7MFCLU8dScdwTa7wO6hQDuWXnK3afKSFgHmnvtWn3kTVKew/78qD9tFVXOzRnY5+Nq6
	D73LiyzgpqVIWFAYg4XNEwM4uPJPb78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1730218913;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nenyWvL0p0mgXQsAwqZGu4dLidfX8h1SUUHlj8B0OKU=;
	b=GVN5C4FpXnVXhR3pWESUlNk1JgGV3vcnPgvhCa3UMpIBLaR8XgJv7q1JRb83/PRuiputK6
	0VW2p9MXPXj0eHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D68C136A5;
	Tue, 29 Oct 2024 16:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a2moAqELIWeMIwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Tue, 29 Oct 2024 16:21:53 +0000
Date: Tue, 29 Oct 2024 17:21:36 +0100
From: David Sterba <dsterba@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20241029162136.GO31418@suse.cz>
Reply-To: dsterba@suse.cz
References: <20241024085701.64263a3b@canb.auug.org.au>
 <20241028090330.2e16fb3a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028090330.2e16fb3a@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: 2C0E01F798
X-Spam-Score: -4.21
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Oct 28, 2024 at 09:03:30AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 24 Oct 2024 08:57:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the btrfs tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > fs/btrfs/super.c: In function 'btrfs_reconfigure_for_mount':
> > fs/btrfs/super.c:2011:56: error: suggest parentheses around '&&' within '||' [-Werror=parentheses]
> >  2011 |         if (!fc->oldapi || !(fc->sb_flags & SB_RDONLY) && (mnt->mnt_sb->s_flags & SB_RDONLY))
> >       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > 
> > Caused by commit
> > 
> >   4642e430c55b ("btrfs: fix mount failure due to remount races")
> > 
> > I have used the btrfs tree from next-20241023 for today.
> 
> I am still seeing this failure.

Sorry, will be fixed in the upcoming for-next snapshot branch.

