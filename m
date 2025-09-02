Return-Path: <linux-next+bounces-8164-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A3B3F7B8
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 10:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5BE03AA636
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 08:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA660246778;
	Tue,  2 Sep 2025 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="F1hLjIdZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE732F757;
	Tue,  2 Sep 2025 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800513; cv=none; b=qEDQN3ldHvC3MUKs3OyqsN8H6+Cpbj/OObLjgYuJumRII0G4unfbwpVmN0awt+7V+QC9haI5KtmALS7ajmAP1i+kvR+0gOU379575rmZB5i1Aqd34RlXX/tooMHtZqIB/Sn9f3Ql8RQcN8BOzrlLntEi8TyIDc57n3uzu/lXX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800513; c=relaxed/simple;
	bh=ErFSpIFWhZyzx0S/jtij6z3AzdzRV2dt3u6HKresHdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EY91EEsmaEulI1XZurHk1I7hHDOBmAz4/mQb+YO9vJvoSPnLWZ8M8cQPcBwn3LR+f1May67NU9NFwd+mWYhfXQzolyk3McJY5WJ0etNpjF/6l1UA2d1yGPQ4FInRrrMdlYNaN2jEFWWOirby8Sckbu8bHITo4AkPL2DIrZojHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=F1hLjIdZ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cGJK757vTz9sjQ;
	Tue,  2 Sep 2025 10:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1756800507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wt0H7S1xX71VzSiImElIEErr8Na6mUy13rTHnG67IgI=;
	b=F1hLjIdZ5tM/6VAHQTliL55eBEhT3Io4U6mfdAVxhWocrU9ZzPXsma44ci/z33Dk7/Yk/6
	BIBOT5Tz3mJhtpj4A4nJbZ+IiMzA9bjo8/ZYW0+XqU5a7WNBzCb6hOr7w6I2WZMlH9rJgs
	6r7e7WmkhdlersPu0mef+AtpWsUnXFqCwEiwVJoRK0TPtD+GPk2DxbcqTjQfoFF4ALJEjz
	rKcsTi6B6q4K2IM6M5QnVBc3WASKaAzMjDLyUiAlNd4F8cx8CmINn116iK42MqaKo/1hbn
	TlymCWANRp9+d5y5wG06v1W6HlxvpPur4HtbVEruR7THJy7bfLuv1tFxSs9l6A==
From: Brahmajit Das <listout@listout.xyz>
To: linux-sound@vger.kernel.org,
	linux-next@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	broonie@kernel.org,
	listout@listout.xyz
Subject: [RFC PATCH] ASoC: Intel: avs: Fix reading 1 or more bytes from a region of size 0
Date: Tue,  2 Sep 2025 13:38:12 +0530
Message-ID: <20250902080812.684149-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 sound/soc/intel/avs/path.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 7aa20fcf1a33..8c3df2002b58 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -134,7 +134,8 @@ static struct avs_tplg_path *avs_condpath_find_variant(struct avs_dev *adev,
 static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
 					    struct avs_tplg_path_template_id *id2)
 {
-	return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
+	return id->id == id2->id &&
+	       !strncmp(id->tplg_name, id2->tplg_name, strlen(id->tplg_name));
 }
 
 static struct avs_path *avs_condpath_find_match(struct avs_dev *adev,
-- 
2.51.0


