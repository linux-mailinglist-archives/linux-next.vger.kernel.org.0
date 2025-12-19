Return-Path: <linux-next+bounces-9485-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3070CCFB97
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 13:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A7C5303D915
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 12:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D95331216;
	Fri, 19 Dec 2025 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cB7yQ9Lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wu2QoCqW"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF7331213
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145970; cv=none; b=Pn6sufYuENDXev24Ja73JmIQvUWfIE4xY5whhhDvVTiKwE/6/R7XgD1JSssLSscTrbQVs+UyhUFysGifA/sx7tMzBGQlNFrso+io1DiRNzCCcAftyl7BiCNOTRiVMLMXhYxF8c1lQH5bgWp8m4Yx3oIQ0b8/pmvh5SF/FDIKI5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145970; c=relaxed/simple;
	bh=OrQ8y/KjF2b52Z42pepnzJIGsTvgzBt0zknnPclnRfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQeDq42g65o2SvbHurH8XMFxeU+MmNs4nQaQ2B3JA4PVgRqEX9eEBPNOYAT9HFmqk47yIGuYGMWnKI1uawNvVhrIUt+ZMPG97d7k13Ks2Kb8Kkcfned73CEMRbU3ajeNmfwGKPBDgVbY/W//nBdrsJ6GNcpozTv5adoRwd2EsWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cB7yQ9Lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wu2QoCqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJAxZ3m3939280
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 12:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IzZI2a7rRCVL15CfB9tR9LFf9hfnkjtO41d
	ZrsPqj0M=; b=cB7yQ9Lq/yg53Z8nr3HzqlavFtAd25Rs04Uybg0kvQkuLc63HyS
	mGbcxFhTnnSmrGGdoZ4JhEkaDQkFWI71ZR3/Sl03omQWlKd7gocphpgwXWmZ3Ski
	+5I7TjQlC4Cu/odNcd0u8j8gAS7Mb5mLp/26Nrv7P38nXCbRvm7G62KqvMFubD+h
	GaQ4JxMamqU8jTk9V//9uGJdahNzwvOrHKa7KxOf6lN7Ffle3kOlAO6lj1xIHQpA
	ZieOQSR/2xtbPI4XCazFqrKzbGmgyK9efK8o/jmWsReMhIQ9guX+8GCZZnpRCA0Q
	sQHtS80pGFappFVIio04tiDhnDqJc1RRl6g==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2juy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 12:06:06 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78c5eff63feso24587207b3.0
        for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145966; x=1766750766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IzZI2a7rRCVL15CfB9tR9LFf9hfnkjtO41dZrsPqj0M=;
        b=Wu2QoCqWAI4eGpWBiMM/o5FMKzfia1n4P9Fo6wkv+zk/KH7v+7IhTs4xzQ2+WxYMvr
         lHC7IEFRBGswuEFgOUuAm/FsrYB6gBLKPENU5yyaj7W81HcBb8LYFs82ehV6yERCh41z
         8adCqabqstjRW5TX7AQZI0KEMyDdlMVuhOA3w8iUJoBgCyBkK4oPFi6TFdwpV7gyhxu8
         54mhUsgL+dg+DQtpWz98KNjPjU6v/yhwTjVnCzAQzkQ6ba/S4BTOyI10WeE4Py9fN8iI
         V8gu7XAcwBDqf6FCHdAAgDdpD+NpLSEe4G9IoIohbFDq8I6V2dpDc5CChs1HX6Xs8f7f
         mXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145966; x=1766750766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzZI2a7rRCVL15CfB9tR9LFf9hfnkjtO41dZrsPqj0M=;
        b=MWXGbJSY1yhvQiAapOWdq/E86IXDmOJnxbUl3e0Zi8o9D3AnXdF6CWQXYbTxKsYvnQ
         CHf3RmCs0fzLubhNHUifDpLSgUNPosoSNnlQhYzeoEkOV3pmuFQdKuCjEto9otNSftOw
         WHIpgiOLKj/N5PwdI3Qal0nR9AGxqFcJHMsnh+FJV9Sngq0Nh6taPJbhA22MFS80Zpzi
         OXgRlVH48a3X9POy7XqMjtvKyZfwgIL/+JrHPXFfsb2fQPXl2EwmgTYZi+teHgkxP1AK
         WKkXTOjxJmJUAODmKkl+5h1DEMuwZ+HCcitVYgEzX4N9lXdVKHrr+0g6bRcm/M8EjnYU
         FeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/KlA+wQKDE4n4p38l807pWGwWfOTToOLr8qiKg/jBymVKe7v9pwZI75hdPNnvg0VBOdoNUJuAei5x@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+uTYMZGrAcSnpI/0DzyS0D0zJshEOdx4PjdfqzErdUMVfB0w
	PGKNP9zwaVH93vEr1d/whtEFskcAFc3GZMyCtuPCyFghmyHRVSA1iGY7ROP8+avveitrogGqi0G
	dxWJY364wTKUZXbNq3QRNILEw8bRzCnSYew8FMveIx0WrPUBW4VJXsuCMvthajDiU
X-Gm-Gg: AY/fxX7P190oKrQQXtgxd73BmgTQ3kcLXK7JEjdT2arK+wzqaX1plpzNBo1rL85pPd9
	/CGF9qzFhdMH8r/ib0ORkVV6FFQ4hj0swF1BzXyAQm710zpLc9UNkDqQZiwmTsJPtkByjWnJXIy
	FV+PBlw2jFeqhZK/BBpjk/f5bvvDHyl6gM0HHt1oAzPoBPKAnfkOrb6GRXVF7AxcC76Dgld22ho
	nIHvKsnQBkaV39LQE7wprmuM3NCiKJvNa6g6EfwvhfYpjX91Yuo8uZm4NjFKkPm9jPS+3x02EN+
	98acYmCWj2SxPLj6oPNnLZPTxEst/AHHJej0K4yO23QC1WmoXtq8aIEGu1JdG1UPZq84mD+c2Vi
	JIb2dDyEmIPDhwIft+uYfAZPWk+fCgHPnUbMsf1EQyq6DeFJQlXuLUtZvsEDKtqOp3u8=
X-Received: by 2002:a05:690c:6f12:b0:788:1eae:3d7f with SMTP id 00721157ae682-78fb41ee82fmr20049087b3.70.1766145965953;
        Fri, 19 Dec 2025 04:06:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVUKSymR3id5+my9YAHLROv2LOA8PHDxmbDvRUDqXYMkV1DyoXnr4nuO8/Jg718H4lOaa92Q==
X-Received: by 2002:a05:690c:6f12:b0:788:1eae:3d7f with SMTP id 00721157ae682-78fb41ee82fmr20048747b3.70.1766145965376;
        Fri, 19 Dec 2025 04:06:05 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f37edasm210625266b.58.2025.12.19.04.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:06:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: 
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] accel: MAINTAINERS: Mark the subsystem as Odd Fixes
Date: Fri, 19 Dec 2025 13:05:59 +0100
Message-ID: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=OrQ8y/KjF2b52Z42pepnzJIGsTvgzBt0zknnPclnRfY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRT+nfHacbjEENJE+UJfAwvezLjldazQSLrWpM
 wfCdSpAhgqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUU/pwAKCRDBN2bmhouD
 194oEACJ0OCpm3VKKrUBljRA29g2YHeosnb+8JieIUND6E3gLEmw7qYK0eg4EZAQE4+BIwrwkxb
 f5VIGR4codnrZsMIPAF4XPaiyl2936HGQsgWCpMigBAPdJtm0dBMheW9PyXh0DrtZ/BZdJGy4kQ
 CJoOjpTX4q4/RyX2PPOamJcAlT5fYpf29R6RsZSAl4DDcOIvTEyBB0toZXzPHaicd0qgzIHCdlK
 oy2vr8EQXw1MSzN4xZTu90+IIzjHycaGYhj26pqIjW3oXVliyMEUMKeH8t7uYuFsuAYTs1rUx0D
 GQdeNx8CilaprzmAEo1cNLuL3pBU52DM0NDTw2rDdEBI5RSWf50ZWfL+ci4mRjKX2tsFIFpJU7L
 siggW+tptnYC0pTVyvyQ+OY9vah2QAglkEE0InSZD8SW7CR6yaw5qUXhvWURHYwDNafE0aczA7v
 qKo86dEHrRyB2TW5pqNAy+5hLTxA2kiGWZKlG+Goa04ayLT7h/wsFyVYGiCWNjlyqoT8njHN0w2
 SKauAtQHJiMCuo9/bIamYpNIwgme5TgJeVmJK+TUNj8Q61E+0hASmDZ/RDaubPYvqEsEsUYihPo
 7dh7sEt16PSHAaCHx2J2H6vQdrxazGbtLlYlpwWPINOHKjjilXaZcSBUaMOsa0PYEt7tqr2ShJl sJ5sX+vAMH7IJYg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xaENpUiKW-Un8wCz6iw7H8h6IZEZBKiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfX8qH0idIQYOhN
 lpyO03DmYju8LUjYanwgsouDa/rtdY1GrNmWFKNA0SZChfY6ELNvJmDIPrsWrTFrRT1CzW8d9Hu
 L9jW02JusWIFnFjJzCNhhcfI5PjoVjIs9yoMxNYjJNwwdNMCfpsUaRv5CZBf1IXo3BhbyXndTjF
 s79QQs1AZNMz4WtiW4q9u3WbMV+dZDFwqSh6Pm1Ddnc5J7MpBSiVICxMenujH66hqZmOcaRU3xI
 sJwo7k6iK+OiF+Gt9j5O74lpT2dWtc+Up5XYpgESB6BE7DCkEzNCeMhC9QgIrXUhWxpHPpDeSuj
 bk3D8xXprfY22hOy+qUN4/3LIUKSEFveSHvt33I30tVIhEHkdab2/DDlh1sSDLOO5N2Lp5TeiBk
 hoUVo0Qye3DS9JPHiblkgybMxeyUGU3TBLr63EOC5Z131p+SVS6ZVW5KRbz22sRLMAAhK4Q2Nxi
 9lKjnz/Z5IWxNadD5PA==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69453fae cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=YL6Xjd1eAAAA:8 a=KJwMiqYiu87tZNhqNnAA:9
 a=MFSWADHSvvjO3QEy5MdX:22 a=MP9ZtiD8KjrkvI0BhSjB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=yLS1KB8ZbIgHeRWbGdJx:22
X-Proofpoint-ORIG-GUID: xaENpUiKW-Un8wCz6iw7H8h6IZEZBKiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190100

The git tree mentioned in MAINTAINERS entry for computer accelerators
was not updated for three years (last tag or branch pushed is v6.1-rc1)
and is being dropped from linux-next [1], thus should not be considered
official maintainer's tree anymore (patches appearing there would not be
visible in the linux-next).  Also, there were not so many reviews from
its maintainer [2], so it seems this subsystem could use another pair of
hands.  Mark it as "Odd Fixes" to indicate that subsystem could use help
or is just not that active anymore.

Link: https://lore.kernel.org/r/20251215184126.39dae2c7@canb.auug.org.au/ [1]
Link: https://lore.kernel.org/all/?q=f%3A%22Oded+Gabbay%22 [2]
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dbf349fc1ed..d97e5b41b998 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7740,9 +7740,8 @@ F:	include/uapi/drm/rocket_accel.h
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
-S:	Maintained
+S:	Odd Fixes
 C:	irc://irc.oftc.net/dri-devel
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
 F:	Documentation/accel/
 F:	drivers/accel/
 F:	include/drm/drm_accel.h
-- 
2.51.0


