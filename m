Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E27138F57
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 11:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgAMKjj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 05:39:39 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:37057 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgAMKjj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 05:39:39 -0500
Received: from ip5f5bd663.dynamic.kabel-deutschland.de ([95.91.214.99] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iqx6U-0001L5-7A; Mon, 13 Jan 2020 10:37:50 +0000
Date:   Mon, 13 Jan 2020 11:37:49 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Amanieu d'Antras <amanieu@gmail.com>,
        Christian Brauner <christian@brauner.io>,
        Kars de Jong <jongk@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] m68k: Implement copy_thread_tls()
Message-ID: <20200113103748.cmuqknofpdis7kqy@wittgenstein>
References: <20200113103040.23661-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200113103040.23661-1-geert@linux-m68k.org>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 13, 2020 at 11:30:40AM +0100, Geert Uytterhoeven wrote:
> This is required for clone3(), which passes the TLS value through a
> struct rather than a register.
> 
> As do_fork() is only available if CONFIG_HAVE_COPY_THREAD_TLS is set,
> m68k_clone() must be changed to call _do_fork() directly.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
