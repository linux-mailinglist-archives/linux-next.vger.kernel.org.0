Return-Path: <linux-next+bounces-5503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92307A3C8AE
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 20:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3B3A7A77A8
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 19:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A2022FDF1;
	Wed, 19 Feb 2025 19:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3GspiWLe";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZuBiIz42";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3GspiWLe";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZuBiIz42"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9D622B5A5
	for <linux-next@vger.kernel.org>; Wed, 19 Feb 2025 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739993368; cv=none; b=C8UjSL80YzyxXxIIQfOn0vPypZ7FVxAudYj5r1FDMeOgZaqjo6M1ArSpis8VUjWlo9DsmIorxskCIvSKX+W/F4R0QuBeNi1sFoF7FR26i3fP0fDy4v2CX7MXPUFpOuLxeeuhZPbS5WH12F8RwPHNbqqRcFC1ipyGAfowrNAo7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739993368; c=relaxed/simple;
	bh=H8HDfsjRdTLeCiSUsEFAPOM3zMyyboUITTD5Uaa1PnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hA3C9Ri1V/XcSDD+eiJUx0heyWunHLKrWvbai4FAetmBwoFSCXK8Me6mOvLeugrvNJa5gZ3c3LJfYgPkL+cA5Pk8EYlLK+CkJSymDhtT41di1KT5frU+bASs/8uQ2KnPrln0eYs4Y4iRRFlT57D8IjKPLNX53mdF0jKPtO90EW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3GspiWLe; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZuBiIz42; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3GspiWLe; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZuBiIz42; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 88B3321137;
	Wed, 19 Feb 2025 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739993363;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qp0pqMz6ueZ4JV1vYoPSBbdk2P2+tc6COjGX7xSlRyo=;
	b=3GspiWLejZnLRU/qUjBgS8UWAiklAxXJh3HigNe/51wkTDXjM+Wc7tPxgQK7LGpnx5IT2y
	RTJx836O3VPeBGUQavL+nBdf7FYEIWhMLpewUkEr+u4vn70SLUMcRq6wtzXI5X1cGsQyOd
	quPUI/iTSwcK/XX4IFILV8t/4vNBXOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739993363;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qp0pqMz6ueZ4JV1vYoPSBbdk2P2+tc6COjGX7xSlRyo=;
	b=ZuBiIz42+gr7xVhLV03J2V2Zxwhn2uaWYQtxLh/0XrmXf2Yyp6/XuwXbEHK2qzLWab9T15
	+OImyck7B7cFx4DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=3GspiWLe;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ZuBiIz42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739993363;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qp0pqMz6ueZ4JV1vYoPSBbdk2P2+tc6COjGX7xSlRyo=;
	b=3GspiWLejZnLRU/qUjBgS8UWAiklAxXJh3HigNe/51wkTDXjM+Wc7tPxgQK7LGpnx5IT2y
	RTJx836O3VPeBGUQavL+nBdf7FYEIWhMLpewUkEr+u4vn70SLUMcRq6wtzXI5X1cGsQyOd
	quPUI/iTSwcK/XX4IFILV8t/4vNBXOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739993363;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qp0pqMz6ueZ4JV1vYoPSBbdk2P2+tc6COjGX7xSlRyo=;
	b=ZuBiIz42+gr7xVhLV03J2V2Zxwhn2uaWYQtxLh/0XrmXf2Yyp6/XuwXbEHK2qzLWab9T15
	+OImyck7B7cFx4DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48B9513715;
	Wed, 19 Feb 2025 19:29:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kPwSERMxtmcrAgAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 19 Feb 2025 19:29:23 +0000
Date: Wed, 19 Feb 2025 20:29:21 +0100
From: David Sterba <dsterba@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
	Joel Stanley <joel@jms.id.au>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nick Terrell <terrelln@fb.com>, Vineet Gupta <vgupta@kernel.org>
Subject: Re: linux-next: trees being removed (zstd tree)
Message-ID: <20250219192921.GF5777@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <20250212095632.6bdd50d7@canb.auug.org.au>
 <20250216224200.50b9dd6a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216224200.50b9dd6a@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: 88B3321137
X-Spam-Level: 
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.21
X-Spam-Flag: NO

On Sun, Feb 16, 2025 at 10:42:00PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 12 Feb 2025 09:56:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Tree			Last commit date
> >   URL
> >   comits (if any)
> > ----			----------------
> > file-locks		2023-09-01 08:09:48 -0700
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git#locks-next
> > fsi			2023-12-14 19:44:11 +1030
> >   git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git#next
> >   ec084e4ec314 ("fsi: sbefifo: Bump up user write cmd length")
> >   f7236a0c919e ("fsi: sbefifo: Handle pending write command")
> >   c5eeb63edac9 ("fsi: Fix panic on scom file read")
> > gpio			2023-09-10 16:28:41 -0700
> >   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next
> > header_cleanup		2024-01-15 15:52:12 -0500
> >   git://evilpiepirate.org/bcachefs.git#header_cleanup
> > kspp-gustavo		2024-01-21 14:11:32 -0800
> >   git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git#for-next/kspp
> > tsm			2023-10-19 18:12:00 -0700
> >   git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux#tsm-next
> > zstd			2023-11-20 14:49:34 -0800
> >   https://github.com/terrelln/linux.git#zstd-next
> >   98988fc8e9ed ("zstd: import upstream v1.5.5")
> >   40eb0e915deb ("zstd: Backport Huffman speed improvement from upstream")
> >   3f832dfb8a8e ("zstd: fix g_debuglevel export warning")
> > zstd-fixes		2023-11-14 17:12:52 -0800
> >   https://github.com/terrelln/linux.git#zstd-linus
> 
> All the above trees have been removed.  Give me a yell if you want one
> back.

That's unfortunate that ZSTD is out of linux-next. We have several
in-kernel users of ZSTD so we need to keep up with its upstream. In the
past the ZSTD syncs were already in big steps, like from 1.4.10 to
1.5.0. Now we don't even have the 1.5.5 updated merged for like 1.5 year
(since 6.6 times).

There are scripts to prepare the update for kernel, it's quite easy to
get it for linux.git testing. There still needs to be a review because
it's userspace code but it should not be that hard.

Unless Nick wants to continue maintaining it, I am reluctantly
volunteering with hopes that somebody will join and take over it
eventually.

