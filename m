Return-Path: <linux-next+bounces-9425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE605CC0A8D
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 03:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C84943009FEC
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6E92E8B75;
	Tue, 16 Dec 2025 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="AInKwhy2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8D4238176
	for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853947; cv=none; b=bXSmf5qnrCg2fuoqMXvoVWS/qifr6NVPgpp3twEIYkfuYSKgEOfA/bsn1QKB684y0XOaTPV2RplYV3WSXEOyerEA0vUW9EO3mN46ZCa4vKPZckM9CAxJNa8O8TCoJqz6bnWhktIkNgLyi+4bH9eM98DAq5o61GA6HEqVvx/2gdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853947; c=relaxed/simple;
	bh=DUsH4njXYV/87KI9/shJLeF1p067+v/sEI1OXGiiHgo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=lKKTzTFLGqeuKfxEv94mmOsTn40qiYmmsqwBXZjvzQHcWj8lYS4d4gduNhtgZFiOerQKkXcZLgLN8I5zMjH1tACLjOn831CZ0SxXby9Eqqbpyw7p8UDvrUdYInxPjQURimqYYueJqJraRqBI6IuW5wgvP8wUeRJMEIUdSS/YRI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=AInKwhy2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c277ea011so3017471a91.1
        for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 18:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765853944; x=1766458744; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQKXw8YrTILdKKNvHcHHluW3GvbMq62ie+hNCacGkuI=;
        b=AInKwhy2DmMeYjC5IBWsQuwFMXT8nznIRWgFYu6KgIdzL7YC8rMdw7l8UNpIyXZbWc
         xJqTZAJoiFkcBQrJf2/glZ894nTcyaU+TwGeZnfDjOL0YI3PBR0iAe4zgxX5SJynCbC8
         WHqAUKRh8I68bR6TKePA5yKtX/emxaqviWpJN1PrlM+Q/Z+Pko9sHZMoW9LyoUzQzf8A
         sz/9p75nhfKV5ppQ4zxqKb1qmKhWnseWJ9ATErEuQB3qtJlCf/G6QrF3omLCxxX+oZmv
         0GAZ24DDXFfInNGzqonv1gS0FgR4sB4Dt4vM75fYWSr9sLymFo30D7hWfiRMVXIXUe+s
         eK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765853944; x=1766458744;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQKXw8YrTILdKKNvHcHHluW3GvbMq62ie+hNCacGkuI=;
        b=qyhnhq1G3kCelzNpd7DfVet3pM+zZbLcAVp1nnT5S5b8iXLFKPie/j2eHacYpFsfYY
         edXH2qYr87FQxGliBMqTk/EoHvJr3SMj8Xcs//kiQST7EJPJXU6NYaP4S0cHuZ8wSAWD
         QeGBY/ceQuX8cSlqtj2so+tHULU7q61ycb00LAhnu/l5yXZRo36zgjwvmRQqWibv7vH0
         PfJlFhI7LihiNm5sO/eJwQ2ggK+xbc91uJq2RIF5dKuQ0deG8L+XMZlCaIeMp7aMNH+p
         5Zt2t1JyDRXshUrqYzItohVxjV3NO5AlmKPC3nceI94X/aLgwSWejQ8pYlyIMooyI/eV
         Vwxg==
X-Forwarded-Encrypted: i=1; AJvYcCWG3yGSiW6veNl1SOJYHyB2+fiQEBYizBA4GYevZhneDW7u0PcpHyqv9bTlXeOKlOmqWqzThdsSvGCj@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/P3e0aHSx2DJFIYVq3VDtIeMuf/NyLeFGqNiNhFWbzESkBM/
	mJJrhS/BayeXLE2avUlNB2IdueTnaS2fmHD+LAUYbWgdkWD4o2z3RvgvfaT4phXcH+s=
X-Gm-Gg: AY/fxX6CLBPsrImJU6jwj+HMC+dMA2yPuaeCK/+2kZOlsRJoCa2UvTvu53aQxajo74X
	p9TUitKU/wlIaGUQcDHXtjJtB94ShIw8PdKqbZhMTUIJcGjGCHjyEKfbYxqpuSF4xybYaQK+raK
	B6zKCSBlOrgRR3saSDZCRxQw+e8DWE/zS18kqLwe8DyAuzR0/jU5f8xPQpK/2w9S439cIRhqP7i
	6vUP/pzt4X5ssMUOtFBc/OYWDu4W+Qm36p11oRp2iPvvB8kTQ/FoagmbcUXHUp0lgteWZz1qobh
	Nu0S9sDbMITI8w3MBRzAPXknD7rxpX1KuelHHoBcPrAgbGyJ2slgffuzjiDpcogHnpWBeunW3Ng
	CFYrMBmJM/WB0NFkuPBHknklhZyNltbJfVB+kPqEUVTNg1jDfVaXzq0krXNqWs6meJR/o9F2td7
	+0bnVZXacP8kolQFs=
X-Google-Smtp-Source: AGHT+IEkPqJ/fj+EpTYs3+K+FUWlhyi59xcdqv1bkVIAG5rD10t7lFjrIwnc3R4q4JDhXd5SvTEBeA==
X-Received: by 2002:a05:7022:b8a:b0:11b:d211:3a64 with SMTP id a92af1059eb24-11f34863cd1mr11179721c88.0.1765853944156;
        Mon, 15 Dec 2025 18:59:04 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb2f4sm47974769c88.3.2025.12.15.18.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 18:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIGluIGV4cGFuc2lvbiBv?=
 =?utf-8?b?ZiBtYWNybyDigJhtaW7igJkgaW4gZnMvZnVzZS9maWxlLm8gKGZzL2Z1c2UvZmls?=
 =?utf-8?b?ZS5jKSBbbG8uLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 16 Dec 2025 02:59:03 -0000
Message-ID: <176585394290.2610.8656861889938723251@77bfb67944a2>





Hello,

New build issue found on next/master:

---
 in expansion of macro ‘min’ in fs/fuse/file.o (fs/fuse/file.c) [logspec:kbuild,kbuild.compiler.note]
---

- dashboard: https://d.kernelci.org/i/maestro:efd5e2937b906561246dc835406f3fd74dd15d9d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  563c8dd425b59e44470e28519107b1efc99f4c7b
- tags: next-20251216

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
fs/fuse/file.c:1326:16: note: in expansion of macro ‘min’
 1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
      |                ^~~

=====================================================


# Builds where the incident occurred:

## 32r2el_defconfig on (mips):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-mips-32r2el_defconfig-6940c4b8cbfd84c3cdba9ce1/.config
- dashboard: https://d.kernelci.org/build/maestro:6940c4b8cbfd84c3cdba9ce1


#kernelci issue maestro:efd5e2937b906561246dc835406f3fd74dd15d9d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

