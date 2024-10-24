Return-Path: <linux-next+bounces-4404-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D629AD918
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 03:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E38F81C21745
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 01:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51894175A6;
	Thu, 24 Oct 2024 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="COuYb7yf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Adu8e4QN";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="COuYb7yf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Adu8e4QN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78BB5223;
	Thu, 24 Oct 2024 01:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729731926; cv=none; b=D7nEqQ71NY2/3If21bnd4aeT7NKYxktHSaw/M2RtdgOsSlQhcaRfvhaQ0cPeK8aEoEDzezslIYZMagmUU/F9TfLk4CqeC9mkhG6XjvU2U6s4EcfrIhtZx4C3vwLh2khU+F0drfcQlhH3QrnZS4a7eIMlZ+0aBDOuOGMdBfG6AF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729731926; c=relaxed/simple;
	bh=WdqBYMoNf+Cws36bhXhrD5L/VO7tzGfRJ+73JrOTOec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8RZGlpCkFUBJTN2kdDRgcULko1d+1zaZ3+sx27dj1grnNSTxpLWPGKu4SjSRdeK2JXlURxW9Qy0hYaCe29KkUD4PXK94WGQWojGFonu6dQkQLHL8++rrqxtwCAke7un3uNi6Yq5H44C6xfXmHWd3kf40Dayx8ER5qgyrFUj/PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=COuYb7yf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Adu8e4QN; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=COuYb7yf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Adu8e4QN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A85ED21CC2;
	Thu, 24 Oct 2024 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1729731921;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5j5psG3f2T4wWVD4B7Jco+i4QYf02hyA3fPkukRpTnQ=;
	b=COuYb7yfsmlXHWk4XO+vf+cwXyq9rdg8CuMW6QhePVyRLo5SFlPfPuVVVdsqVzgf6rOWs2
	Q6xfCy3tUJrjl9+IMJvu6tHQzzPUKR4Z9tROITlw9ILJDw0gAd+/SeoFLDS+NcNZKkZPuu
	MKufNy4Z5kn8mM2fNm92cTdlY8wx57A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1729731921;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5j5psG3f2T4wWVD4B7Jco+i4QYf02hyA3fPkukRpTnQ=;
	b=Adu8e4QNZJrekPCLjs3c92iCLMFt+eY2TibuhEWGI7fLc49fIy8xduUB0UDvGcDGUrZQcZ
	Q5ZSAANpL8Sca8Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=COuYb7yf;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Adu8e4QN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1729731921;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5j5psG3f2T4wWVD4B7Jco+i4QYf02hyA3fPkukRpTnQ=;
	b=COuYb7yfsmlXHWk4XO+vf+cwXyq9rdg8CuMW6QhePVyRLo5SFlPfPuVVVdsqVzgf6rOWs2
	Q6xfCy3tUJrjl9+IMJvu6tHQzzPUKR4Z9tROITlw9ILJDw0gAd+/SeoFLDS+NcNZKkZPuu
	MKufNy4Z5kn8mM2fNm92cTdlY8wx57A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1729731921;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5j5psG3f2T4wWVD4B7Jco+i4QYf02hyA3fPkukRpTnQ=;
	b=Adu8e4QNZJrekPCLjs3c92iCLMFt+eY2TibuhEWGI7fLc49fIy8xduUB0UDvGcDGUrZQcZ
	Q5ZSAANpL8Sca8Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8380913A63;
	Thu, 24 Oct 2024 01:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YjzgH1GdGWcjQwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 24 Oct 2024 01:05:21 +0000
Date: Thu, 24 Oct 2024 03:05:20 +0200
From: David Sterba <dsterba@suse.cz>
To: Qu Wenruo <wqu@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20241024010520.GG31418@suse.cz>
Reply-To: dsterba@suse.cz
References: <20241024085701.64263a3b@canb.auug.org.au>
 <95af7735-cb97-491c-be22-8e9759f4720f@suse.com>
 <20241024004729.GF31418@suse.cz>
 <1ecd327d-108d-427a-b964-da46b0496088@suse.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ecd327d-108d-427a-b964-da46b0496088@suse.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: A85ED21CC2
X-Spam-Level: 
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:dkim,suse.cz:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.21
X-Spam-Flag: NO

On Thu, Oct 24, 2024 at 11:22:57AM +1030, Qu Wenruo wrote:
> 
> 
> 在 2024/10/24 11:17, David Sterba 写道:
> > On Thu, Oct 24, 2024 at 08:58:58AM +1030, Qu Wenruo wrote:
> >>
> >>
> >> 在 2024/10/24 08:27, Stephen Rothwell 写道:
> >>> Hi all,
> >>>
> >>> After merging the btrfs tree, today's linux-next build (x86_64
> >>> allmodconfig) failed like this:
> >>>
> >>> fs/btrfs/super.c: In function 'btrfs_reconfigure_for_mount':
> >>> fs/btrfs/super.c:2011:56: error: suggest parentheses around '&&' within '||' [-Werror=parentheses]
> >>>    2011 |         if (!fc->oldapi || !(fc->sb_flags & SB_RDONLY) && (mnt->mnt_sb->s_flags & SB_RDONLY))
> >>>         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> cc1: all warnings being treated as errors
> >>>
> >>> Caused by commit
> >>>
> >>>     4642e430c55b ("btrfs: fix mount failure due to remount races")
> >>
> >> My bad, in fact a new patch is going to remove the oldapi check
> >> completely as newer mount using new API will break the per-subvolume
> >> RO/RW again.
> >>
> >> Thus a new patch is needed to remove the oldapi check first
> >> (https://lore.kernel.org/linux-btrfs/e1a70aa6dd0fc9ba6c7050a5befb3bd5b75a1377.1729664802.git.wqu@suse.com/),
> >> then the newer v2 patch
> >> (https://lore.kernel.org/linux-btrfs/08e45ca0-5ed9-4684-940f-1e956a936628@gmx.com/T/#t)
> >> will be completely fine.
> > 
> > I probably missed the v2 and picked the patch with warning that I did
> > not consider too serious but it seems linux-next builds with -Werrror.
> > Meanwhile I've updated the for-next snapshot branch and dropped the
> > patch.
> 
> I'd prefer to pick the v2 and its dependency ("btrfs: fix per-subvolume 
> RO/RW flags with new mount API") for early testing.
> 
> As I'm pretty sure the rolling distros are already rolling out new mount 
> using the fsconfig API, and breaking our per-subvolume RO/RW mount.
> 
> The promise that new mount API will solve the per-subvolume RO/RW 
> without reconfiguration is mostly a lie.
> The reality is, RO mount is still passed with both 
> fsconfig(FSCONFIG_SET_FLAG, "ro") and  mount_setattr(MOUNT_ATTR_RDONLY), 
> doing exactly the same thing as the old mount.

I'm monitoring the recent mount option problems, it's maybe due to
syzbot and/or various users noticing what does not work anymore after
the conversion to the new mount API in 6.8. Once the fixes are tested
they're on the fast track to be in the next RC. In particular the RO/RW
for subvolumes is maybe the most contentious change, but we have the use
case and it ultimately must work. I would not call it a 'lie', I don't
think there's an evil interest to break it, but we may be missing
testing coverage so we notice it a few releases later. Anyway, fixes for
mount option behaviour are always amenable for RC fixes.

