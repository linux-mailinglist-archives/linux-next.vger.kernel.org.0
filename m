Return-Path: <linux-next+bounces-8168-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21062B3FBF8
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 12:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFD881B246CB
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 10:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C6B2F2906;
	Tue,  2 Sep 2025 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="SglupOZ9"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117E2E7F35;
	Tue,  2 Sep 2025 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808006; cv=none; b=GptXxMSYVqRQ70x/Srt3MttWA8rYChVtyRPdrsxm3oEzBmE6orQDpmKWMeBSGbzCGYwMkNC/yC6bCJJpH+Co73AWrpEbpxtFPjEiqFsNyQqkPy8VYY3RVHKLT9zpLEtme3F2A9Qq+5pmbSrcxAFWKNcYHKMWp5BOV0otf61bYbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808006; c=relaxed/simple;
	bh=+x5+xD327VrVKvC2XSn/z/9w7E65qib68L3AOO9oPAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwBVRb6pgGenIKVB8BVenQ2oue8G0v4CQeqDeqZCkYIknmNRXOrhMSXiy87ZSwEYHGco6HCxPl515c7F8ZuY0lTnHhlbwIaU+5rqYojpmXXj5QFauRayiWJPlGOldUNk1TnsyHLtSUOZwEagWMNxTzCE5lE+Qirm3muH7JaxC58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=SglupOZ9; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cGM5D3m96z9tdj;
	Tue,  2 Sep 2025 12:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1756808000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ut931pixYQwzMDm0QpIBcKlrBgaiL2aTzr2h+zhhBg=;
	b=SglupOZ9rMN5H43LDeYRwuXljvh5qRNSNSTffQVU2/6NztElcoJFTyALEUik8nX8gVFgmD
	ARk8qcKwcKU5LlYfUKu9cyuD+/0bUUKZGvJDGO39diMrsJMfvWl+HuCm0xAwkeLWT7pB0q
	bJbkUtAH7SniV/l9hOgVCPsWTDj6e4+D+q0Z4WnNVPUhnDtS94SFEdQTUmvq5OBRmNG/d9
	pGtPJlAsi54mk3RAajgHlwiiheyYbYXexYPWF64yvNFYrU9UfZEpk+CUyucpmdzrOd34Kh
	/LaXQ/pTHAqOHxQwkaxPHpXAITAOxSN/2TtUQ0a8wkHUY0t4zHyFTzMk4O6hLg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=listout@listout.xyz
Date: Tue, 2 Sep 2025 15:43:09 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-next@vger.kernel.org, 
	cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
	yung-chuan.liao@linux.intel.com, broonie@kernel.org
Subject: [RFC PATCH v2] ASoC: Intel: avs: Fix reading 1 or more bytes from a
 region of size 0
Message-ID: <5i2wpum25e3nljoxuuccys6fzby2qznytzcl7fke62wlc52tzf@7gzae2lreggu>
References: <20250902080812.684149-1-listout@listout.xyz>
 <87qzwp9so4.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87qzwp9so4.wl-tiwai@suse.de>
X-Rspamd-Queue-Id: 4cGM5D3m96z9tdj

Building the next tree with GCC 16, results in the following error:

sound/soc/intel/avs/path.c:137:38: error: ‘strcmp’ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
  137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from sound/soc/intel/avs/path.h:14,
                 from sound/soc/intel/avs/path.c:15:
sound/soc/intel/avs/topology.h: In function ‘avs_condpaths_walk’:
sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object ‘id’ of size 4
  150 |         u32 id;
      |             ^~
sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object ‘id’ of size 4

I'm not quite sure if this is a GCC bug or a problem with the source
code.
As an workaround, instead of using strcmp, strncmp helps. But would
really appriciate comments from developers as I'm sure there might be a
better way to fix this.

Introduced by commit 595b7f155b926 ("ASoC: Intel: avs: Conditional-path
support")

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
Changes in v2:
        - using sizeof()-1 instead of strlen() due to tplg_name being
        fixed size array
---
 sound/soc/intel/avs/path.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 7aa20fcf1a33..367de5225ec4 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -134,7 +134,8 @@ static struct avs_tplg_path *avs_condpath_find_variant(struct avs_dev *adev,
 static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
                                            struct avs_tplg_path_template_id *id2)
 {
-       return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
+       return id->id == id2->id && !strncmp(id->tplg_name, id2->tplg_name,
+                                            sizeof(id->tplg_name) - 1);
 }

 static struct avs_path *avs_condpath_find_match(struct avs_dev *adev,
--
2.51.0

