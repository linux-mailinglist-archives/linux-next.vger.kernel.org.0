Return-Path: <linux-next+bounces-6184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B695CA80722
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 14:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DCD8866E9
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 12:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322A526B2DD;
	Tue,  8 Apr 2025 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bCIXj9mf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+wE0iaNX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bCIXj9mf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+wE0iaNX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F9B1FCFF3
	for <linux-next@vger.kernel.org>; Tue,  8 Apr 2025 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114743; cv=none; b=YNiaMFOw/x3UjsXftYZHfp4/DKR73SzYMiG8Gwj6BXCQgwmF9OaiqnRoUF99nA9Y3u6yzMJGmbAdKgMmwpt24Is27ZP0R7zyp9NiEQHOlS+pdD7JwD7gCIlmI7p9CT5PrHSuQ76Sx+dDgFMw9LPAW/lz5ivjVLKpT2vmuDWsvB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114743; c=relaxed/simple;
	bh=sYPxeZK936EVFr7AsQTpdf5bA66QrnQRSJ598hdXWcQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C02QyxR9ArVC/pEcD9gViR8cy41HlZgeVKxqyxS64Nuc4WhZfXwErwNt/xUjW5/Xo5Kt900EDdaNQi4UpD0MkgSvfwR7C2kh9jTVeqyAtvo/eVYMIaHpKL44ZyI0TNuyaXzl0idtcGDOCNFFeLzxZFmprYjsTv/xamJHBuC5f8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bCIXj9mf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+wE0iaNX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bCIXj9mf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+wE0iaNX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BD8B021185;
	Tue,  8 Apr 2025 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744114739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGYcgBHc8VjoivNn4IjEqPycNCabc5c0VhqSLw5Xq+M=;
	b=bCIXj9mfzc3TAgwExTHXyb/lpHybAwrQN5XtHIf7QIqfkNRvL0hmS0h4mXgFqn9s8I2u6V
	GKYtgQ8ZjIEgxLD3sQX6u7ERJqImbPT9Fyk96fFXeG7cn9ivTPkY/dxNCf8POSy2X7aacp
	Vu8X/xL/tPWUMW07s+zZVFnHxBxvTro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744114739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGYcgBHc8VjoivNn4IjEqPycNCabc5c0VhqSLw5Xq+M=;
	b=+wE0iaNXPGwzDxbFwqpFvUv1qnSnjwFah/K6CHTZoizOVoxSd6uU9/Uf6aAPWIilwrY4Qx
	zHAocH2DK6b2/XDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744114739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGYcgBHc8VjoivNn4IjEqPycNCabc5c0VhqSLw5Xq+M=;
	b=bCIXj9mfzc3TAgwExTHXyb/lpHybAwrQN5XtHIf7QIqfkNRvL0hmS0h4mXgFqn9s8I2u6V
	GKYtgQ8ZjIEgxLD3sQX6u7ERJqImbPT9Fyk96fFXeG7cn9ivTPkY/dxNCf8POSy2X7aacp
	Vu8X/xL/tPWUMW07s+zZVFnHxBxvTro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744114739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGYcgBHc8VjoivNn4IjEqPycNCabc5c0VhqSLw5Xq+M=;
	b=+wE0iaNXPGwzDxbFwqpFvUv1qnSnjwFah/K6CHTZoizOVoxSd6uU9/Uf6aAPWIilwrY4Qx
	zHAocH2DK6b2/XDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A658213A1E;
	Tue,  8 Apr 2025 12:18:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GFQaKDMU9WekGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Apr 2025 12:18:59 +0000
Date: Tue, 08 Apr 2025 14:18:59 +0200
Message-ID: <87tt6yhmmk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the sound-asoc tree
In-Reply-To: <20250408132729.78ce049a@canb.auug.org.au>
References: <20250408132729.78ce049a@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,suse.de,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 08 Apr 2025 05:27:29 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> The following commit is also in the sound tree as a different commit
> (but the same patch):
> 
>   7288aa73e5cf ("ASoC: loongson: Replace deprecated PCI functions")
> 
> This is commit
> 
>   a81aca6f8ed8 ("ASoC: loongson: Replace deprecated PCI functions")
> 
> in the sound tree.

Yes, it's an oversight.  Since the doubly commits shouldn't bring too
much problem for this small change, we decided to keep as is.


thanks,

Takashi

