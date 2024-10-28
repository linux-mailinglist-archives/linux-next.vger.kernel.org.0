Return-Path: <linux-next+bounces-4494-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560C9B3445
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 16:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9486B235D4
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6661DE2B5;
	Mon, 28 Oct 2024 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xScg+AQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UebAxn6F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xScg+AQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UebAxn6F"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02341DD0DB;
	Mon, 28 Oct 2024 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127800; cv=none; b=KI3MA6I8fv5TGaQlw4BokiAhGtJL9NdkFYRz3UrumVNKnaw+GU1Hf+2Yw9JoskoG6ItnNFvM36/S+4ukkYrHibCW6wR0QPHvtg94DS0SS12tn+BInA3pGiMnvGAEQPEdV680oX2mhZ4WF802f0PYA/OBeU2dia7vhZIFm52sSns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127800; c=relaxed/simple;
	bh=FyfUCwFzYkQHmB9U8vscKzqdTeoR6hFWQB3RDlBiCO8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbRLep7tkqrK7OAf92b54nONrTnRoFIxF82O9l6jOchUWVOg5JIKfEKstFbqRC9jarvRuSmCwD/UgFiea+qtdbBMg148ZspOU+H2NmvPxn3Ew9lEFC5T2kYGhlEctiflC+BP5AbI9ZX2EI613UWxCLjW7xpGz24OgyZu2f7YmbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xScg+AQ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UebAxn6F; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xScg+AQ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UebAxn6F; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DEF851FD9B;
	Mon, 28 Oct 2024 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730127795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qwjx7KI2wJnXIRsjYCHo7TaA6tPWUHwucJtMHXYI714=;
	b=xScg+AQ+r9773h88ATgYoqvE9LTLzAVyt21/NiWiZuRS117NTvaFO6NT/4ilr8aDWMr9s7
	HpPV2GxA9FD469HvT+3LOIaSezXURipz3MaYsubYoG8H0Sp2BQgP6SpxvAB61l6jumiqva
	/FDxgEPZ+torkH6w+Uzt43Wk85i+jkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730127795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qwjx7KI2wJnXIRsjYCHo7TaA6tPWUHwucJtMHXYI714=;
	b=UebAxn6FkLO0fi1wKRnqj3UZmwh6Al90gyqtSrXvt+QEzjrs/1pHjUweKTqLydeFpew2wO
	ATg8vBiD9J0zIlAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730127795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qwjx7KI2wJnXIRsjYCHo7TaA6tPWUHwucJtMHXYI714=;
	b=xScg+AQ+r9773h88ATgYoqvE9LTLzAVyt21/NiWiZuRS117NTvaFO6NT/4ilr8aDWMr9s7
	HpPV2GxA9FD469HvT+3LOIaSezXURipz3MaYsubYoG8H0Sp2BQgP6SpxvAB61l6jumiqva
	/FDxgEPZ+torkH6w+Uzt43Wk85i+jkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730127795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qwjx7KI2wJnXIRsjYCHo7TaA6tPWUHwucJtMHXYI714=;
	b=UebAxn6FkLO0fi1wKRnqj3UZmwh6Al90gyqtSrXvt+QEzjrs/1pHjUweKTqLydeFpew2wO
	ATg8vBiD9J0zIlAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 972E9136DC;
	Mon, 28 Oct 2024 15:03:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R7rUIrOnH2chDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Oct 2024 15:03:15 +0000
Date: Mon, 28 Oct 2024 16:04:18 +0100
Message-ID: <878qu8qnf1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,	Linux Next
 Mailing List <linux-next@vger.kernel.org>,	Linux Documentation
 <linux-doc@vger.kernel.org>,	Linux Sound System
 <linux-sound@vger.kernel.org>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Jonathan Corbet <corbet@lwn.net>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH 0/2] Documentation fixes for ALSA Co-processor Acceleration API
In-Reply-To: <20241028111647.17378-1-bagasdotme@gmail.com>
References: <20241028111647.17378-1-bagasdotme@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 28 Oct 2024 12:16:45 +0100,
Bagas Sanjaya wrote:
> 
> A small (two-patches) series fixing htmldocs warnings on sound tree that
> first being noticed in linux-next integration [1].
> 
> [1]: https://lore.kernel.org/linux-next/20241028193242.11597640@canb.auug.org.au/
> 
> Bagas Sanjaya (2):
>   ALSA: docs: compress-accel: Format state machine flowchart as code
>     block
>   ALSA: docs: Add toctree index entry for co-processor acceleration API

Applied both patches now.  Thanks.


Takashi

