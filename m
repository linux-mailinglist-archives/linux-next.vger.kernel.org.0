Return-Path: <linux-next+bounces-9504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FFCDBE55
	for <lists+linux-next@lfdr.de>; Wed, 24 Dec 2025 11:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA81E3008D6B
	for <lists+linux-next@lfdr.de>; Wed, 24 Dec 2025 10:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E724330B34;
	Wed, 24 Dec 2025 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Acw7zHlV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zLvGVEOx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Acw7zHlV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zLvGVEOx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F317329E62
	for <linux-next@vger.kernel.org>; Wed, 24 Dec 2025 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570767; cv=none; b=cA88LiqU2YQK/F/TSkClSwOKPJ4I8PU/z1xR+azpU+94+neuJCsla4OjXuZrK7wleh9OpsiuEXlNQat5yf4l15M+cAiTu8fqhAHbEz6CGBnUxGLF+CoTrM9/oWMVEw7qlW/aFIrsqQh8sqys5PkshcOuEhrLM3O5iPFwG1bpYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570767; c=relaxed/simple;
	bh=qZIeqNi0cmBfWoKMHkExDVZ2szgSc6q8+NFFQtoq1Bo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lULYW42OYk+RY3HPpA4zQWGcSS4LWpWa3eGbIUKyKN6JWqy+3UdQllRORLZUU1F57eaiTp/Hv+nxhhPU0XsZ7m1M5gib0YrfBeU+JkSxhBeVkvfk1/VSJkcMbgUeh9fNnZRCaMBYGNBelUTbMykvoU169tEF5WopzyQ5/UpiF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Acw7zHlV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zLvGVEOx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Acw7zHlV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zLvGVEOx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1F973369A;
	Wed, 24 Dec 2025 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766570757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqzFNQ8SEvYdWJ38DLnaa5ckexHHTvk3ZEAc17Gm58g=;
	b=Acw7zHlVZiO7DhE0qJIyiNBbkbog+wGwLf6uEVkAP17IOoNdvtMV2sYYOythSk9pJzQ7nL
	1FXVjyIo5cRBoxQTltyfz0y+bUh3DwiW5X3WmkydkykoNVz2u4NZS62YYtGI2bpu/Lrfzi
	0ztzl+Bw8l99upqixysuyHd5cVSS7CY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766570757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqzFNQ8SEvYdWJ38DLnaa5ckexHHTvk3ZEAc17Gm58g=;
	b=zLvGVEOxlsKPCzUhobqERUiBW0xxH9l7Ttwo1fi0plXqWFjt5zc/dpPELP+7LrHfcyNhIR
	onAm7mQhHkG1W9Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766570757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqzFNQ8SEvYdWJ38DLnaa5ckexHHTvk3ZEAc17Gm58g=;
	b=Acw7zHlVZiO7DhE0qJIyiNBbkbog+wGwLf6uEVkAP17IOoNdvtMV2sYYOythSk9pJzQ7nL
	1FXVjyIo5cRBoxQTltyfz0y+bUh3DwiW5X3WmkydkykoNVz2u4NZS62YYtGI2bpu/Lrfzi
	0ztzl+Bw8l99upqixysuyHd5cVSS7CY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766570757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqzFNQ8SEvYdWJ38DLnaa5ckexHHTvk3ZEAc17Gm58g=;
	b=zLvGVEOxlsKPCzUhobqERUiBW0xxH9l7Ttwo1fi0plXqWFjt5zc/dpPELP+7LrHfcyNhIR
	onAm7mQhHkG1W9Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C92E3EA63;
	Wed, 24 Dec 2025 10:05:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U4EWAAW7S2kBRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Dec 2025 10:05:57 +0000
Date: Wed, 24 Dec 2025 11:05:56 +0100
Message-ID: <877bucgpob.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brahmajit Das <listout@listout.xyz>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>,	Mark Brown
 <broonie@kernel.org>,	linux-sound@vger.kernel.org,
	linux-next@vger.kernel.org,	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,	peter.ujfalusi@linux.intel.com,
	tiwai@suse.com
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
In-Reply-To: <aUsBgVbloPqBa6sZ@localhost>
References: <20251221185531.6453-1-listout@listout.xyz>
	<176650962400.445350.17331328109538303145.b4-ty@kernel.org>
	<20251223192409.50a6e4ab@fedora>
	<aUsBgVbloPqBa6sZ@localhost>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.27 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.17)[-0.859];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.27

On Tue, 23 Dec 2025 21:57:09 +0100,
Brahmajit Das wrote:
> 
> On 23.12.2025 19:24, Amadeusz Sławiński wrote:
> > On Tue, 23 Dec 2025 17:07:04 +0000
> > Mark Brown <broonie@kernel.org> wrote:
> > 
> ...snip...
> > 
> > Missed this patch and it got applied...
> > 
> > Anyway above log seems bit weird, as this struct should be well defined:
> > struct avs_tplg_path_template_id {
> > 	u32 id;
> > 	char tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> > };
> > are you sure that SNDRV_CTL_ELEM_ID_NAME_MAXLEN didn't somehow end up
> > being 0? As that would be a real problem.
> > 
> > sysfs_streq is similar to strcmp, but with different order of checks so
> > it will just mask an issue, if there really is one. And reading its
> > description I don't think it should be used in this case.
> > 
> > Can you instead try reverting it and hardcoding value in struct like:
> > struct avs_tplg_path_template_id {
> > 	u32 id;
> > 	char tplg_name[44];
> > };
> > to see if the error is gone?
> 
> Does not seem to help, unfortunately :(
> 
> Current changes (after reverting my patch)
> 
> diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
> index 1cf7455b6c01..ed839774bfe2 100644
> --- a/sound/soc/intel/avs/topology.h
> +++ b/sound/soc/intel/avs/topology.h
> @@ -150,7 +150,7 @@ struct avs_tplg_binding {
> 
>  struct avs_tplg_path_template_id {
>         u32 id;
> -       char tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> +       char tplg_name[44];
>  };
> 
>  struct avs_tplg_path_template {
> 
> Build output:
> 
> 
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC [M]  sound/soc/intel/avs/path.o
> In function ‘avs_tplg_path_template_id_equal’,
>     inlined from ‘avs_condpath_find_match’ at sound/soc/intel/avs/path.c:160:6,
>     inlined from ‘avs_condpaths_walk’ at sound/soc/intel/avs/path.c:1274:13:
> sound/soc/intel/avs/path.c:137:38: error: ‘strcmp’ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
>   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ‘avs_condpaths_walk’: events 1-3
>   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
>       |                ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                  |   |
>       |                                  |   (3) warning happens here
>       |                                  (1) when the condition is evaluated to true
> ......
>   155 |         if (id->id != path->template->owner->id ||
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                                 |
>       |                                                 (2) when the condition is evaluated to false
>   156 |             strcmp(id->tplg_name, path->template->owner->owner->name))
>       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from sound/soc/intel/avs/path.h:14,
>                  from sound/soc/intel/avs/path.c:15:
> sound/soc/intel/avs/topology.h: In function ‘avs_condpaths_walk’:
> sound/soc/intel/avs/topology.h:152:13: note: at offset 4 into source object ‘id’ of size 4
>   152 |         u32 id;
>       |             ^~
> sound/soc/intel/avs/topology.h:152:13: note: at offset 4 into source object ‘id’ of size 4
> cc1: all warnings being treated as errors
> make[6]: *** [scripts/Makefile.build:287: sound/soc/intel/avs/path.o] Error 1
> make[5]: *** [scripts/Makefile.build:556: sound/soc/intel/avs] Error 2
> make[4]: *** [scripts/Makefile.build:556: sound/soc/intel] Error 2
> make[3]: *** [scripts/Makefile.build:556: sound/soc] Error 2
> make[2]: *** [scripts/Makefile.build:556: sound] Error 2
> make[1]: *** [/home/bdas/linux/Makefile:2060: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2

I believe it's a false positive, too.
Or is it about potentially unterminated strings?


Takashi

