Return-Path: <linux-next+bounces-9703-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B787ED3B00B
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 17:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FAF9304698D
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ACF296BD3;
	Mon, 19 Jan 2026 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJgW4/8w"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA2288C0A;
	Mon, 19 Jan 2026 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838988; cv=none; b=BtFShVeITO/IfDRhV+wDd2IFEmfbxjE1YSG+g0oDs3WsvFg8f54+GZ24gbPTdspAy7G1rJDmDQZSl3CrqX54vldsEXuxiDBBtJc9b4W0Rj4atTdrRl/tCu0/Pmcbp1XHkZYbcb7/ws7d7blX/wgDPoB841LED0xvxNp4RlCu+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838988; c=relaxed/simple;
	bh=zc4sY5FqynenxO/ZE5el0mWkxPgSB264gPFmbsQQBQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VqDHvU7g7ZNC9Xy1v9WUZpt86Fop766lkCF5VlRueyoFNMV5CLKYZbJQTX7c8Gb0qDhhFZIB+yHHdW+FK9rChdF5iqpedYgDaxCbL+nue1RcjB1IpDhEczULYK+HLZ/vc//EG2wIR4ED2JDxjZhqAU+OtREFOf6AFpPUeOqagUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJgW4/8w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47F8C116C6;
	Mon, 19 Jan 2026 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838988;
	bh=zc4sY5FqynenxO/ZE5el0mWkxPgSB264gPFmbsQQBQw=;
	h=Date:From:To:Cc:Subject:From;
	b=hJgW4/8wqFM9Zpy3T8KOLdq7GHAGh3cTr2nVcBP7K2BDbbUm5pqMCslbKQJR4XlHd
	 NeLLgCly5DaLfCiKHeZgmO2yArMLXo+fMsGrFJFVDpno2cpeFcThQ18RBAjU9dEXlb
	 g4q6oLdcKKz86f1HQJKK3rysUSSrplK7gLMQ6MFlhoOOjsS7qnnQ6RMcGKXciWnDU5
	 35w4wzV+dyS+muNy0FPmLPxgzS66zbyDso5VNwfjo6Hd0DY7nsEkjagbart3M7bnbG
	 6gP5LF16Whn8/tUeU6IeleweXSwmzrCTIexAKQe5IL7u8aGgG1DqF9Iid5EshyacZg
	 x4lzeDCEv/O+Q==
Date: Mon, 19 Jan 2026 16:09:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the perf tree
Message-ID: <aW5XSAo88_LBPSYI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the perf tree, today's linux-next build (arm64 perf)
failed like this:

Exception processing /tmp/next/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
Traceback (most recent call last):
  File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 1405, in ftw
    action(parents, item)
    ~~~~~~^^^^^^^^^^^^^^^
  File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 656, in preprocess_one_file
    for event in read_json_events(item.path, topic):
                 ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 464, in read_json_events
    events = json.load(open(path), object_hook=JsonEvent)
  File "/usr/lib/python3.13/json/__init__.py", line 293, in load
    return loads(fp.read(),
        cls=cls, object_hook=object_hook,
        parse_float=parse_float, parse_int=parse_int,
        parse_constant=parse_constant, object_pairs_hook=object_pairs_hook, **kw)
  File "/usr/lib/python3.13/json/__init__.py", line 359, in loads
    return cls(**kw).decode(s)
           ~~~~~~~~~~~~~~~~^^^
  File "/usr/lib/python3.13/json/decoder.py", line 345, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/json/decoder.py", line 361, in raw_decode
    obj, end = self.scan_once(s, idx)
               ~~~~~~~~~~~~~~^^^^^^^^
  File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 422, in __init__
    raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
argparse.ArgumentTypeError: ('Cannot find arch std event:', 'PMU_OVFS')

Caused by commit

   a66f6242fbf52 (perf vendor events arm64: Remove uncountable events)

I have used the perf tree from 20260116 instead.

