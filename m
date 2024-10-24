Return-Path: <linux-next+bounces-4400-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A829AD900
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 02:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3269A282BA0
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 00:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427B634CDD;
	Thu, 24 Oct 2024 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="v0MjZLi2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="bq8XsotH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="v0MjZLi2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="bq8XsotH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC92C18C;
	Thu, 24 Oct 2024 00:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729730855; cv=none; b=ofq53blOnA4tdI5I2XPmZupUpC/iE365UHu1QwRSUFZeSLIGHWJ04GwRIWF4H4M9JGNui9k2TQ1qzGFfBqBIQJERWeTIzluidxOPsqZGgNiY5RfhAusCUBrs9YU5O58lp3INSNaKpxslfVP+qxR06TLi+hFZgo947pdNgBM2F5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729730855; c=relaxed/simple;
	bh=0tJOTNTGqTspxxbh4+pbHrhu6MDUW3iOQ1FPc+T1pSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpHYBdxjCiM5EGpbM6jqTLdxzYTzEqvB2xjozNwlLWw44lrtBMgf/HUhbF0GIYaAL9LKOkegN3Kiefl/gA3Ef6xozM+mnFdzsKq2/kghu+8jKYXIMj7C3zPRCUV5hmSDpjbJvRvGj10RIm7S0xQl8Dr9JTNLYPSNhhU3rMAwePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=v0MjZLi2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=bq8XsotH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=v0MjZLi2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=bq8XsotH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B65A1FE15;
	Thu, 24 Oct 2024 00:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1729730850;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBHdVltqgWZeKFslU8r2IyoUrywUwOKymXf3yKdcBKU=;
	b=v0MjZLi2iz01OI5UKS2LxUjwuxX83w3ZHX4qzalMpKWSDuuRfNA1NwAM2MUGagfMVC/mfu
	jEpOjqH6gWsq1VlF2UwyJL8XgdHCGEUVoUjp2Q5YfUsFeAqmk20ZXgtFpBqsJQGADGyIBB
	DnJ0H0v5QDez6sSKt3ZGV8xEXlpwfV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1729730850;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBHdVltqgWZeKFslU8r2IyoUrywUwOKymXf3yKdcBKU=;
	b=bq8XsotHUNMopP9T6wvOvSsy/EKWcOYKazTgJ5/7KScHU3Zmea7aPJuWYRGOKiPnvq+SVG
	DKjJNhM3vGEovMBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=v0MjZLi2;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=bq8XsotH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1729730850;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBHdVltqgWZeKFslU8r2IyoUrywUwOKymXf3yKdcBKU=;
	b=v0MjZLi2iz01OI5UKS2LxUjwuxX83w3ZHX4qzalMpKWSDuuRfNA1NwAM2MUGagfMVC/mfu
	jEpOjqH6gWsq1VlF2UwyJL8XgdHCGEUVoUjp2Q5YfUsFeAqmk20ZXgtFpBqsJQGADGyIBB
	DnJ0H0v5QDez6sSKt3ZGV8xEXlpwfV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1729730850;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBHdVltqgWZeKFslU8r2IyoUrywUwOKymXf3yKdcBKU=;
	b=bq8XsotHUNMopP9T6wvOvSsy/EKWcOYKazTgJ5/7KScHU3Zmea7aPJuWYRGOKiPnvq+SVG
	DKjJNhM3vGEovMBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65C33136F5;
	Thu, 24 Oct 2024 00:47:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6XpdGCKZGWeZPgAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 24 Oct 2024 00:47:30 +0000
Date: Thu, 24 Oct 2024 02:47:29 +0200
From: David Sterba <dsterba@suse.cz>
To: Qu Wenruo <wqu@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20241024004729.GF31418@suse.cz>
Reply-To: dsterba@suse.cz
References: <20241024085701.64263a3b@canb.auug.org.au>
 <95af7735-cb97-491c-be22-8e9759f4720f@suse.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95af7735-cb97-491c-be22-8e9759f4720f@suse.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: 8B65A1FE15
X-Spam-Score: -4.21
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:mid,suse.cz:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Oct 24, 2024 at 08:58:58AM +1030, Qu Wenruo wrote:
> 
> 
> 在 2024/10/24 08:27, Stephen Rothwell 写道:
> > Hi all,
> > 
> > After merging the btrfs tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > fs/btrfs/super.c: In function 'btrfs_reconfigure_for_mount':
> > fs/btrfs/super.c:2011:56: error: suggest parentheses around '&&' within '||' [-Werror=parentheses]
> >   2011 |         if (!fc->oldapi || !(fc->sb_flags & SB_RDONLY) && (mnt->mnt_sb->s_flags & SB_RDONLY))
> >        |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > 
> > Caused by commit
> > 
> >    4642e430c55b ("btrfs: fix mount failure due to remount races")
> 
> My bad, in fact a new patch is going to remove the oldapi check 
> completely as newer mount using new API will break the per-subvolume 
> RO/RW again.
> 
> Thus a new patch is needed to remove the oldapi check first 
> (https://lore.kernel.org/linux-btrfs/e1a70aa6dd0fc9ba6c7050a5befb3bd5b75a1377.1729664802.git.wqu@suse.com/), 
> then the newer v2 patch 
> (https://lore.kernel.org/linux-btrfs/08e45ca0-5ed9-4684-940f-1e956a936628@gmx.com/T/#t) 
> will be completely fine.

I probably missed the v2 and picked the patch with warning that I did
not consider too serious but it seems linux-next builds with -Werrror.
Meanwhile I've updated the for-next snapshot branch and dropped the
patch.

