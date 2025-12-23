Return-Path: <linux-next+bounces-9503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2CCDAA89
	for <lists+linux-next@lfdr.de>; Tue, 23 Dec 2025 22:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 861BA30C18F0
	for <lists+linux-next@lfdr.de>; Tue, 23 Dec 2025 20:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE63420C029;
	Tue, 23 Dec 2025 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="nRtA3Zbf"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74A861FCE;
	Tue, 23 Dec 2025 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523451; cv=none; b=mW4oflBFnogNP3ilXyLQL6zkTKEVG+oQzD29YL0nbd3sQsEN5MVCY/cZ0O1Thd3hg547qUidp/26ACZNOIbNWKyEh7QVUTiaImRnbwMYzzUyYYKy7X/QoA26AVchm/gw5E2FffX9M3A4AqkjUo2uPWZx8+lcqcCizFO/88zrtoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523451; c=relaxed/simple;
	bh=o2HewFMo7KFgOpmjJh3hp+K0hOgwxh+IEVkWG7t7AkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYCeHu4sYlg8cYgXUGIuQilMFENbf/8KzGCE+kUvEl3PaNVq3g1kzM1DCWe1SVGzyjgsVsMvdqluz3szjao63kKTk/UkWW/MB29jS9p8u5Gxc9Kl4Ww/qXfXbWO0snD4+9Uma0vA4/LB3t7ZpF9/VVyFbS5Sg7KpTwoO/aP087A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=nRtA3Zbf; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dbS4Z4Trvz9v8y;
	Tue, 23 Dec 2025 21:57:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1766523438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TttYAUqChRjZCy3xhPuAM3XSuG7OKGQ/Uc88ZlihPA=;
	b=nRtA3ZbfBmVjzQbgUoMT2TgNtrlqzSHbcmc6YAQkTDf8kW4vUyACwdoVyifZb6E8Yzg4Yg
	VfaFNBM8n/zAekBdPTzApgyJmFc0x5GYmGBzp+gHVgkX12HXu5E9tFiTtjk3yL/x3DcSMd
	X9i3W7G9DtPFZJQnFjFwnJ5d5wnTZbUSI3O9WMFoFo1l85UDLvQdo62SeQlV0q0HwBDPjQ
	hFJs82uot2oRU1pL24OssK8Ccm/L/k5xIcPSCmnw1YGg3sujkBxkDiFZIEqC60WpbhEICR
	IvRYTxXEmFvvIWrk2JySlqdFPh975bN8KgUa4v9BeUO3aQiP9ZLxBAEEcLvvQw==
Date: Wed, 24 Dec 2025 02:27:09 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	linux-next@vger.kernel.org, cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, tiwai@suse.com
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Message-ID: <aUsBgVbloPqBa6sZ@localhost>
References: <20251221185531.6453-1-listout@listout.xyz>
 <176650962400.445350.17331328109538303145.b4-ty@kernel.org>
 <20251223192409.50a6e4ab@fedora>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223192409.50a6e4ab@fedora>

On 23.12.2025 19:24, Amadeusz Sławiński wrote:
> On Tue, 23 Dec 2025 17:07:04 +0000
> Mark Brown <broonie@kernel.org> wrote:
> 
...snip...
> 
> Missed this patch and it got applied...
> 
> Anyway above log seems bit weird, as this struct should be well defined:
> struct avs_tplg_path_template_id {
> 	u32 id;
> 	char tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> };
> are you sure that SNDRV_CTL_ELEM_ID_NAME_MAXLEN didn't somehow end up
> being 0? As that would be a real problem.
> 
> sysfs_streq is similar to strcmp, but with different order of checks so
> it will just mask an issue, if there really is one. And reading its
> description I don't think it should be used in this case.
> 
> Can you instead try reverting it and hardcoding value in struct like:
> struct avs_tplg_path_template_id {
> 	u32 id;
> 	char tplg_name[44];
> };
> to see if the error is gone?

Does not seem to help, unfortunately :(

Current changes (after reverting my patch)

diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 1cf7455b6c01..ed839774bfe2 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -150,7 +150,7 @@ struct avs_tplg_binding {

 struct avs_tplg_path_template_id {
        u32 id;
-       char tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+       char tplg_name[44];
 };

 struct avs_tplg_path_template {

Build output:


  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  sound/soc/intel/avs/path.o
In function ‘avs_tplg_path_template_id_equal’,
    inlined from ‘avs_condpath_find_match’ at sound/soc/intel/avs/path.c:160:6,
    inlined from ‘avs_condpaths_walk’ at sound/soc/intel/avs/path.c:1274:13:
sound/soc/intel/avs/path.c:137:38: error: ‘strcmp’ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
  137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ‘avs_condpaths_walk’: events 1-3
  137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
      |                ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                  |   |
      |                                  |   (3) warning happens here
      |                                  (1) when the condition is evaluated to true
......
  155 |         if (id->id != path->template->owner->id ||
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                 |
      |                                                 (2) when the condition is evaluated to false
  156 |             strcmp(id->tplg_name, path->template->owner->owner->name))
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from sound/soc/intel/avs/path.h:14,
                 from sound/soc/intel/avs/path.c:15:
sound/soc/intel/avs/topology.h: In function ‘avs_condpaths_walk’:
sound/soc/intel/avs/topology.h:152:13: note: at offset 4 into source object ‘id’ of size 4
  152 |         u32 id;
      |             ^~
sound/soc/intel/avs/topology.h:152:13: note: at offset 4 into source object ‘id’ of size 4
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:287: sound/soc/intel/avs/path.o] Error 1
make[5]: *** [scripts/Makefile.build:556: sound/soc/intel/avs] Error 2
make[4]: *** [scripts/Makefile.build:556: sound/soc/intel] Error 2
make[3]: *** [scripts/Makefile.build:556: sound/soc] Error 2
make[2]: *** [scripts/Makefile.build:556: sound] Error 2
make[1]: *** [/home/bdas/linux/Makefile:2060: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
-- 
Regards,
listout

