Return-Path: <linux-next+bounces-9500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3BCD444F
	for <lists+linux-next@lfdr.de>; Sun, 21 Dec 2025 19:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82A973006626
	for <lists+linux-next@lfdr.de>; Sun, 21 Dec 2025 18:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F322D46B4;
	Sun, 21 Dec 2025 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="Y1vhWhmb"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E7784A35;
	Sun, 21 Dec 2025 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766343359; cv=none; b=i7fZD3+Q51Z19B+eC7pM89VbX5XDDHRdi3FvECpz+2tXcyNgqw0FA0sV7NkMmhc4PREhiv3QycQN6fAWYrqzPxYtTaese9HjZHInLUNumT9leCz7lLuX0MT9xj6CN+WzXv1XF4VqPrDeb2Hpo7WkDGhzT3MrLxDMKsh4OaPwFZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766343359; c=relaxed/simple;
	bh=D0PE8ulduF/4Y7/luRgujlZh1wasm/zQw9e19DKriU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PkxjxcFrUXlRFlMlf9uWeTGvDQG1gg4ewgce4M6Yjxx8h1YFpIg6xlqdYMxlaeYG/Va9vqh05T10qIH6qzweCBkYCZW0AGH2huhqT6jfz9gdDVcIFiNdOpvrVgCMnRKECimCwIlwh7CdHBI7UtJj8JTFUzYGbhc/E0f5pGJUs54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=Y1vhWhmb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dZ9TG6QmNz9sxL;
	Sun, 21 Dec 2025 19:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1766343346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rN0UTgZdEjrMzQ13Qub5z4W0GbpTiuRRgW5DU3OtIiw=;
	b=Y1vhWhmb4IGagPJL9SUrWfbpymo+tJvAiDzxNWeYRaOsAw3yoqZaPrF1Oy/dMU0SymK1qR
	9lMTvj0eRiLYyUf2iRD94nBFDdWQXkXfhp51nQFuu1DtweC/fNLaB89pTRW3qmZ7omXVej
	b/rmo33wrvdCpsPX1PxXPIpbCimCAwkDi8DYRuUDDDhGi18jqEfdW1l+G3sIe1I13jH878
	pXOiwA5/BfabAa9zbfHh9JiK8snZju1NyuTBsIbRI9bTaXUQLkP7TAY65QZIVUuYFpN2C4
	AbaZ0Mso5mljmaZ2TeVRNw9sDhLCb4D0+MmycoDtoaU1DuVST/p5vwbKx5VB0w==
From: Brahmajit Das <listout@listout.xyz>
To: linux-sound@vger.kernel.org,
	linux-next@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	broonie@kernel.org,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	tiwai@suse.com,
	listout@listout.xyz
Subject: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Date: Mon, 22 Dec 2025 00:25:31 +0530
Message-ID: <20251221185531.6453-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

allmodconfig failes to build with GCC 16 with the following build error

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

Using the sysfs_streq as an alternative to strcmp helps getting around
this build failure.
Please also refer
https://docs.kernel.org/core-api/kernel-api.html#c.__sysfs_match_string

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
There are other instances of strcmp in the file, which I've not touched
since I'm not sure if they need to replaced and compiler specifically
complained about this instance only.

The idea about using sysfs_streq comes from the kernel documentations
about __sysfs_match_string where in the description it is mentioned
"Uses sysfs_streq instead of strcmp for matching."
---
 sound/soc/intel/avs/path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 7aa20fcf1a33..0c66c8bb2f89 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -134,7 +134,7 @@ static struct avs_tplg_path *avs_condpath_find_variant(struct avs_dev *adev,
 static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
 					    struct avs_tplg_path_template_id *id2)
 {
-	return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
+	return id->id == id2->id && !sysfs_streq(id->tplg_name, id2->tplg_name);
 }
 
 static struct avs_path *avs_condpath_find_match(struct avs_dev *adev,
-- 
2.52.0


