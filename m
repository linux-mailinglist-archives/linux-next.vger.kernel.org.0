Return-Path: <linux-next+bounces-9635-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29905D18810
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 12:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F80C30082C7
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 11:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3A931AF24;
	Tue, 13 Jan 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPVxA1ZO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8EB30BB83
	for <linux-next@vger.kernel.org>; Tue, 13 Jan 2026 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304113; cv=none; b=FMD+yHiJ8xxX7c97b0Bx7eE/3MJXM3SaaHNYZFnbdZOi73Ow0ar5L9436DhD65dKSs6on5rHZ3opJTdAeS8PRNzqKxsmE4Bz4q3c+Ll718sSSEbOC3K3V4SRI6Uq8nkukrJVLJDyzjH8j7CYVO4UfK/oXlvY9iTbRZLvmEtxbHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304113; c=relaxed/simple;
	bh=DzjdrARxpA4Phl2lJLNsZj4+3xCd8O7dW6cZCQoDiMM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QKZ5wyoVicTNyu3UFq0qlyvKSDfPhaklQfTlVTsRGplKvhcK6hWS94nqjW+v0PIqfveGzb4v0JtCt4g8f2dSuEq544f5dpZrOhDhvTxMZ9X+TiyNyyOF72AlleCWi4+mU0w3XkEeqjA1oEoBjqIbenR0ltmhrJQ67LpnYItKphk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPVxA1ZO; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-644715aad1aso7670296d50.0
        for <linux-next@vger.kernel.org>; Tue, 13 Jan 2026 03:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768304111; x=1768908911; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DzjdrARxpA4Phl2lJLNsZj4+3xCd8O7dW6cZCQoDiMM=;
        b=WPVxA1ZOvRvwdNUzhtP+YZ1n824UA5Wh3aiKsCkhwJdrZK8AiYSlB5SngKdXdEClQX
         dmxUFCbSh4rQ9x/mZGOqjyIBKi7M9EFbc22MJmtNWou2gj8yOHXOmis+n/mwohGqSXnk
         wZ4ya2fEitw0WNjh9TaOGA5c0d2CEiAZst4GefxZU69g2XFKbC1GVYaYM1f5wfF7Tmqn
         pZ8YQXfoBmPEKb2zon/d4rDYObzFZdNLy9yRIRxXj36JmQIERrTI4S5kjU1KosQ95xsT
         5wTyAD7j1SAwJJitYza4vMxun2V8YHM5cetVlIWUcOqzIgcLlnd3VRtYbq0MiQDt9ZRE
         TbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768304111; x=1768908911;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzjdrARxpA4Phl2lJLNsZj4+3xCd8O7dW6cZCQoDiMM=;
        b=KEJCmmSi3ciUsN2n+QX/mmAHkk/1UWuvhgA7QgEMZukACXWVBZHwGoT/P6Hy32I9J+
         P1fKa4LV1QmOY9fqKqaeetq4BelQeWyf3NU6Zs50WYCJcuhnPmu5xnWByZERJQ7bbDV7
         3xPe2TbLlkZofvQg9pzFDJCd6CGGmxT49CMkyRxPjNgM2Q0iHfG/ezftaTKaS8+SurSQ
         zfSzaF6PIb+TkTLMxCTF9RZV1QuNlyFUBsM9fGraE0ZphSYpEEl1qIFm7JhIarBqQc7M
         o9fkmom492sbScnPMQiI73xCeOTypAsAqQsoof+4dST5Nzll1zfOKxJu19mC1BZVN1ZS
         qYhg==
X-Gm-Message-State: AOJu0Yyyt/ggB7xM4tBsDE0PyQ9HNaUS5zoFBBXbz7N0PT/OYJTg4sud
	z0gXqCBG1NWW5WLVynaG40Z1z6EGEBotIfoCzDa3skhQx732wzVHbsme3P4cxC6AB+xs25Pp8SM
	lt73mdyU3RzL92anUUt08DfgnKXsY6WBtvgRTi3s=
X-Gm-Gg: AY/fxX61C724aJUkGfCcxNW8tAUk323d8EuocxrCY8l9sQvDXg5IgoYS74XoBrgm9wj
	pJiXAdWkQLmWWGGx2gqmZrBpRKLxse9IO/eEAmB9F6Nk981n2v5rTxTsrBbZqEKn504zs/OEg2p
	m3NAjkPhYF2i3TyliYYehI48Ohqjj5HoLlIPY3ohj2FyzhZxhd0/AkmYry3C2kpSOal5HJxx/CU
	TGrh59hHg4Y5G4//mebPizBS8OR/LO8pM8/XEaueq+HyeIFjSluOHKQmofYnV7B83clUglP54DG
	qmzg03htNbXVRLBABu+rJfUIPPZV4XL0V3HOMaQ=
X-Received: by 2002:a05:690e:1911:b0:63f:b6c0:23f8 with SMTP id
 956f58d0204a3-648f632650fmr2385586d50.33.1768304111464; Tue, 13 Jan 2026
 03:35:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mohamed Bana <mohamed.omar.bana@gmail.com>
Date: Tue, 13 Jan 2026 11:34:35 +0000
X-Gm-Features: AZwV_QgRIY4y2FKn3J1qzZ-zHhHBo5sHHsuRCjmzLnB3NtO81kh5D36QhzTBV_o
Message-ID: <CAOygLHJFN3BwLLYFF-rViJm_YUa5zzt4KnDN2cHUyev712h-Og@mail.gmail.com>
Subject: arm64: dts: qcom: Issue with the dts for Medion SPRCHRGD 14 S1 Elite
To: linux-next@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Support was added for the Medion SPRCHRGD 14 S1, which is based on the
Qualcomm Snapdragon X Elite SoC (X1E78100) in [1]. I am
unsure if the suffix Elite makes a difference to this device tree
working or not, but I suspect it does not.

1. I am having trouble booting the
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
or rather at the time of writing this
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts?id=8cf65490cdb03c0254448a54f9098686bf9029ec.
I think I have narrowed it down to this in the `.dts` file:

x1e80100-medion-sprchrgd-14-s1.dts:

```dts
...
// Some combination of `mdss_dp0.status ="okay"` and `mdss_dp2.status
="okay"` cause the system not to boot.
// So, set do not set `mdss_dp2.status ="okay"` otherwise it will fail
to boot and probably just lead to a restart.
&mdss_dp2 {
sound-name-prefix = "DisplayPort2";
// status = "okay";
};
...
```

After re-compiling the `.dts` with `mdss_dp2.status ="okay"` commented
out, I can boot. You can see more information at [4].

2. Could we possibly rename the file to
`x1e78100-medion-sprchrgd-14-s1-elite.dts` instead of
`x1e80100-medion-sprchrgd-14-s1.dts`? The laptop is actually a
`x1e78100` and the name ends with Elite.

3. Did someone or a group of people test out the `.dts` before it was
pushed to `linux-next`? I am basically wondering
why it fails to boot on my laptop [2].

4. I am trying to get sound working but to no avail. Based on [3], I
tried the below but still no audio:

```sh
sudo apt install git build-essential m4

git clone -b medion-display-port
git@github.com:tuxedo-ggo/audioreach-topology.git
cd audioreach-topology/
cmake .
cmake --build .
sudo cp -vi qcom/x1e80100/X1E80100-MEDION-SPRCHRGD-14-S1-tplg.bin
/lib/firmware/qcom/x1e80100/

cd ..

git clone -b medion-sprchrgd-dp git@github.com:tuxedo-ggo/alsa-ucm-conf.git
cd alsa-ucm-conf/ucm2
sudo cp -avi * /usr/share/alsa/ucm2/

reboot
```

References:

[1]: https://lkml.org/lkml/2025/12/4/963
[2]: https://www.scan.co.uk/products/14-medion-sprchrgd-14-s1-elite-28k-wqxgaplus-120hz-snapdragon-x1e-78-100-32gb-ddr5-1tb-nvme-ssd-adre
[3]: https://lists.openwall.net/linux-kernel/2025/12/04/1008
[4]: https://bugs.launchpad.net/ubuntu-concept/+bug/2137257

Kind regards,
- Bana

