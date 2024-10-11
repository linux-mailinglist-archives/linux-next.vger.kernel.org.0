Return-Path: <linux-next+bounces-4241-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2CA999DBB
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 09:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A42B2858E0
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 07:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DAA20968C;
	Fri, 11 Oct 2024 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PQWVrayn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p3vHxDUZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PQWVrayn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p3vHxDUZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF01F4FDF;
	Fri, 11 Oct 2024 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631274; cv=none; b=PKztTsimBIdh1WFOg6bVJ/pLAVr9g519mPci8LZwsjFx+pwN2JnLAoNDkd4tutJZqLoTuX/n3jR3GZxou86dmlrT0PrwdCOBBhclRkJ8SyrxDgSNWr/rWZOXgLFNFU3QEiX7PMEzK0RYdkdNd1Rsph5zLrDJGcl8AxzVexuZXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631274; c=relaxed/simple;
	bh=ej/yJCXL6Tpz3b0iejZlOHoFCm/VhoZYtdWwJLZWq7I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgHmNxbu8BfcpIwb+L6vtTIdOVi51Bs2JMgF75d1OvSeHP6VAE/9Nf8COOFDBHSem8iV9CXsy8dNfq7j/6aURN3wNZ0lq1WIBqw8n7YspteefUwlUzEP6DDFNqLwqTpZdJ9gp7yyho2EvfG76+25opXdh47Ye1agsIRtul1aeiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PQWVrayn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p3vHxDUZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PQWVrayn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p3vHxDUZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 46D2221D4F;
	Fri, 11 Oct 2024 07:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728631270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGvFOPrTi/sc7M6QPbA/dp56ZVzzZnA6kcDSA552HbA=;
	b=PQWVraynwNE52z78xOF9ztAbjddXMJURmmRvKzPQSOoOe8s/wDSplSL8DAXghIGJVX6MmW
	DWeIdt42ba3vr+E5rKgtiy8L5gMJ9O7WFf/JCPb2gqzIumjeeY0Iy2jvtEoMJAKiteX4Do
	1FswlO6w7awqIiRjcBW5a1xMI9OBK00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728631270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGvFOPrTi/sc7M6QPbA/dp56ZVzzZnA6kcDSA552HbA=;
	b=p3vHxDUZYi3kWCAy9l6BSfg9fuyN0TC8bgEAwmy1BUoq2kypipz7cf2eQgdTYnRqVJjx7g
	ZwC3etOWJjxyPZAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PQWVrayn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p3vHxDUZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728631270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGvFOPrTi/sc7M6QPbA/dp56ZVzzZnA6kcDSA552HbA=;
	b=PQWVraynwNE52z78xOF9ztAbjddXMJURmmRvKzPQSOoOe8s/wDSplSL8DAXghIGJVX6MmW
	DWeIdt42ba3vr+E5rKgtiy8L5gMJ9O7WFf/JCPb2gqzIumjeeY0Iy2jvtEoMJAKiteX4Do
	1FswlO6w7awqIiRjcBW5a1xMI9OBK00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728631270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGvFOPrTi/sc7M6QPbA/dp56ZVzzZnA6kcDSA552HbA=;
	b=p3vHxDUZYi3kWCAy9l6BSfg9fuyN0TC8bgEAwmy1BUoq2kypipz7cf2eQgdTYnRqVJjx7g
	ZwC3etOWJjxyPZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2317013AAF;
	Fri, 11 Oct 2024 07:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Rfs1BubRCGcqBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Oct 2024 07:21:10 +0000
Date: Fri, 11 Oct 2024 09:22:06 +0200
Message-ID: <8734l3nly9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound tree
In-Reply-To: <20241011131046.5eb3905a@canb.auug.org.au>
References: <20241011131046.5eb3905a@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 46D2221D4F
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 11 Oct 2024 04:10:46 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> After merging the sound tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from sound/pci/hda/patch_realtek.c:29:
> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                          ^~~~
> sound/pci/hda/patch_realtek.c:10759:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10759 |         HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10759:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10759 |         HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fixup_tbl[712]')
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10759:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10759 |         HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                          ^~~~
> sound/pci/hda/patch_realtek.c:10764:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10764 |         HDA_CODEC_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10764:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10764 |         HDA_CODEC_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fixup_tbl[717]')
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10764:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10764 |         HDA_CODEC_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                          ^~~~
> sound/pci/hda/patch_realtek.c:10779:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10779 |         HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10779:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10779 |         HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fixup_tbl[732]')
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10779:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10779 |         HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                          ^~~~
> sound/pci/hda/patch_realtek.c:10781:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10781 |         HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10781:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10781 |         HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C),
>       |         ^~~~~~~~~~~~~~~
> sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fixup_tbl[734]')
>   312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
>       |                                                                 ^
> sound/pci/hda/patch_realtek.c:10781:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
> 10781 |         HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C),
>       |         ^~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   5b1913a79c3e ("ALSA: hda: Use own quirk lookup helper")
> 
> This build has CONFIG_SND_DEBUG_VERBOSE not set.
> 
> I have used the sound tree from next-20241010 for today.

Sorry for the trouble, the fix submitted and merged now.


Takashi

