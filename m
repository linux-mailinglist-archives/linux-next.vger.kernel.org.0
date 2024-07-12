Return-Path: <linux-next+bounces-2970-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843C92FA0C
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 14:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1D41F22470
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB34D156F28;
	Fri, 12 Jul 2024 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="ExpF8skn"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DE9EAC7;
	Fri, 12 Jul 2024 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720786703; cv=none; b=P4p1o2WIiecqeYbzTbUns/TUTqaEJh6nc3DRcSym5hCK0R1o2/O3jLzWKChw112nbQkG6yD7tVhquLNuyISh6Xi+KQX2omJWqXHGc15erKugdsHfG/ddFrbPk7FevMojV2/bOb9/S8xcF53VBNYpJeMrrTVZp9RyVapkMYUPWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720786703; c=relaxed/simple;
	bh=OANoTuoGoQiFC+RYRuUgcp535q0ufRXffhtDGr4YecU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pH13/+HWN1KY4klOt8lcIi+++HOCZBO0ph4kZ9GyF8jAN1duPoatib32RgtwxFJhDkdHhP5zKTzDqStCGGsyPCID+6TgxXp9rAS5HBy1ugtuaUVcuv68W+t+yUBUT+LvY9EbCg+jGkkTcujAPqU5K8d6Q2FBvguEQrk3ZkFVIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=ExpF8skn; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720786683; x=1721391483; i=spasswolf@web.de;
	bh=OANoTuoGoQiFC+RYRuUgcp535q0ufRXffhtDGr4YecU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:cc:content-transfer-encoding:content-type:
	 date:from:message-id:mime-version:reply-to:subject:to;
	b=ExpF8sknSZ2UFT7UVKBmridES6VRmXxS1F8CFI2pxeMOWDoGEKarw7Whu5zTL+n6
	 10vcFMYqzns2U77duDvhzYk1AmEaOyG5thFWjk2Bf8S2fajgTiG1jgnXDlxLJmhIn
	 GQM5tcWw05GUg4ilTfnC4vly1EjIXBIPL05OL7XqsmIaqdaAABwVnahIKXOf1r3zU
	 4ZP+NiHY7g0C9l7WlN/C3BtGbp0yHr9lZrC48UTh4APSyAP2JcUu2igHpR+aiRJqr
	 5AAG3/mWgJT45q9xQHRb+l1LniP+mzDtmHfe7YZ1FhSikWgxfBAtMYylv/pJ/KkX+
	 92RRpbuCRagcPSXl3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MMpCg-1sl0Wt1AXc-00KNPW; Fri, 12 Jul 2024 14:18:03 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Pei Li <peili.dev@gmail.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH] mm: Fix mmap_assert_locked() in follow_pte()
Date: Fri, 12 Jul 2024 14:17:58 +0200
Message-ID: <20240712121800.3049-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: 20240712080414.GA47643@google.com
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jj4yqdkE527pyY3SjpXZ7w5xCsDUyzuyDN2llM21dpyeUfVkaEj
 8c8QcgL5R2B7xVPQuMOwBlnlD45KD+8EP0bPK8HWlLhBF3i76Pb/VjX2RMb5hR9ctwNIj8M
 ds9WV0M5FPACEa5zyP2mK3r1hG/76rqX6f0yUD+wujQyHnPIEd553x9RNSmP3SYD/gYL8k2
 1ojcQkGhf1FsfK8MGNa0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dHtLm5iMoQA=;IYmXqux8Z3H9WpQfWGaQANw7us5
 TDmjnSAKgGEOBoPR1f3mNHeon7KjtXT2+7r2iCxJeEuh0JhNKGU0RWNofpixBy7daeFqifSFG
 YQ3Ucg/mkj0QoMYdCclzeDDZPzV4X0SrXc3NsaLUkgV0immjZemndltgXMrEGs/UOq2zOIIs4
 x/o+ykNz8hh0cppqflIqWorex86N0x/LS8pgB2x53n1x4HFGrsv6Gb5RZJeAvlKTNjH3yxzXa
 Z8pw+gqpQPllnKUH+TZKpFHVANJASiJtWebb1pttU/73bye80LyBkwddBdrhH6aLtjge9LxPT
 QEIJnj4S6/HH4HUiXgRYjZ9cuyqGxQ9Rr0Ki1L7urNR66MSZgAWHcco4SCNGlmhUZbB+F5WWA
 W5Y6VogjCl915XakB0cnIeIMFtR37ak98bD8lv0TFNwUY4mOWW8GZwXoOc/0n1ybXCUvmMGT0
 q5tx7ZxNRIKEMIcGGR1ZSsu2nwdtVCdYYIox/zBkIHvZTF6l9WqhwBCXWKvd0H1lNIpdfWiKk
 3CQXY3jZr6PP5l7eVuHnk1Mtcq1ajQwmBAzLu5yJkKNDTT7erknO8+kfEqE/7FoDIsR3wC/77
 jJwgDOr4S2OjcGbwuL/zDOdRZC5udV39EGcnmdiZjpJLwNmbgdrLskOvfFC+0B2wuWQFhlS5w
 uz+Bx4+tQXXzdpEpr0r6Q26kPdZt+EiP4jo1rwGt+GWPDOzOEqZbGufrJGo2vYean/zM1pt6+
 0S/BNLo5iU5skT/tvSKFrxTC2La+4D1pEK2fsc910Bc+cfK6Rl+OO2X6lUA3/yXnnwG0bGjjm
 NQqJQ3qyec1jAy870IA+9O9g==

This is causing a deadlock for me, too. Since linux-next-20240712 I observe
a hang when starting the gui. I bisected this to commit a13252049629 and
reverting this commit in linux-next-20240712 fixes the issue for me.
I do not have any log messages to prove the dead lock, though, as I compiled
everything without CONFIG_LOCKDEP.

Bert Karwatzki

