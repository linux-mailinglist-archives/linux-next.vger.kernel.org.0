Return-Path: <linux-next+bounces-9502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C6CDA48E
	for <lists+linux-next@lfdr.de>; Tue, 23 Dec 2025 19:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A3F301E904
	for <lists+linux-next@lfdr.de>; Tue, 23 Dec 2025 18:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946E42F691B;
	Tue, 23 Dec 2025 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="g6M7XmUM"
X-Original-To: linux-next@vger.kernel.org
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB95335BA;
	Tue, 23 Dec 2025 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766514912; cv=none; b=Tot4FYEaDpI51zvJuMzQJyOFg+vR9w8jna7xhBm8FEZSvAShiJgF7mNDG8gIkfGauNZYRWYzA+FZ8N9OC9Y83oxY/JqNsC9fP3b3mGB3ByzVnvEsw1VVSNRDpmgbecwG6xdSdAXLTXpw2t87T8zctjDY4MohjB/ZS3dzTlGW/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766514912; c=relaxed/simple;
	bh=373ONrRCOSCYGzOia28ViKZ0C1YIFMsnQbzgLvj8+LA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3vUNgSbbE9miuSWFOsu0eU2XL3M/XrVCdQJjNLdEspHEMKoPC6LZeM62kEE3DAZI9DXUap0TSSHYE7fSOxVBr9xWR+UYnyge8+4SdlQ477ajP5CL71IouwxyRPEHJsgDxd+R/BRN4zZ16nVg5oVmB35e7vL9PNcdXYfPtw4KhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=g6M7XmUM; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
X-Virus-Scanned: by amavisd-new using ClamAV (5)
X-Spam-Flag: NO
X-Spam-Score: -0.635
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1766514251;
	bh=Zmx6vZYD8gUZNi+Ccn5DplDIvGQ554AVJ8mkLOaeqWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g6M7XmUM0bjaNu85GfP7jM0pu7ktgw4LSNjICJD6UDfp7nvY8gwk14Frx0CYcN03i
	 GInqyKRgI6SLQoCjon2qF7vjlCkWAo69Ot3P9bmikBUsrh7cYxQyjJUeUMTdM/IwGM
	 xlmt+6YaN1AszaVSjMq/YpgBAGMJbpWuK5J4akQJ3NWP9accImsZWpaDaLfMLjSLHY
	 sorKTYGWsaOIIJJflERF9PvFnAkoFNOzANLOZSnTNOTiW/BDfZ/eHnFWd+ArS9qBri
	 BB8mh3a3kis/BuZeSmw2ulszjjZm1PhwoYOqXEN8eIJTYn//b5PTjN1XMD0ZzS9QYL
	 C1KAnClhjHTNw==
Received: from fedora (91-150-220-202.dynamic.play.pl [91.150.220.202])
	by server753313.nazwa.pl (Postfix) with ESMTP id CFA721BCBB5;
	Tue, 23 Dec 2025 19:24:10 +0100 (CET)
Date: Tue, 23 Dec 2025 19:24:09 +0100
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-next@vger.kernel.org, Brahmajit Das
 <listout@listout.xyz>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 tiwai@suse.com
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Message-ID: <20251223192409.50a6e4ab@fedora>
In-Reply-To: <176650962400.445350.17331328109538303145.b4-ty@kernel.org>
References: <20251221185531.6453-1-listout@listout.xyz>
	<176650962400.445350.17331328109538303145.b4-ty@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.57
X-NA-AI-Is-Spam: no

On Tue, 23 Dec 2025 17:07:04 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Mon, 22 Dec 2025 00:25:31 +0530, Brahmajit Das wrote:
> > allmodconfig failes to build with GCC 16 with the following build error
> > 
> > sound/soc/intel/avs/path.c:137:38: error: ‘strcmp’ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
> >   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
> >       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   ‘avs_condpaths_walk’: events 1-3
> >   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
> >       |                ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |                                  |   |
> >       |                                  |   (3) warning happens here
> >       |                                  (1) when the condition is evaluated to true
> > ......
> >   155 |         if (id->id != path->template->owner->id ||
> >       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |                                                 |
> >       |                                                 (2) when the condition is evaluated to false
> >   156 |             strcmp(id->tplg_name, path->template->owner->owner->name))
> >       |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from sound/soc/intel/avs/path.h:14,
> >                  from sound/soc/intel/avs/path.c:15:
> > sound/soc/intel/avs/topology.h: In function ‘avs_condpaths_walk’:
> > sound/soc/intel/avs/topology.h:152:13: note: at offset 4 into source object ‘id’ of size 4
> >   152 |         u32 id;
> >       |             ^~
> > 
> > [...]  
> 
> Applied to
> 

Missed this patch and it got applied...

Anyway above log seems bit weird, as this struct should be well defined:
struct avs_tplg_path_template_id {
	u32 id;
	char tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
};
are you sure that SNDRV_CTL_ELEM_ID_NAME_MAXLEN didn't somehow end up
being 0? As that would be a real problem.

sysfs_streq is similar to strcmp, but with different order of checks so
it will just mask an issue, if there really is one. And reading its
description I don't think it should be used in this case.

Can you instead try reverting it and hardcoding value in struct like:
struct avs_tplg_path_template_id {
	u32 id;
	char tplg_name[44];
};
to see if the error is gone?

