Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989A22449E2
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 14:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgHNMlf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 08:41:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgHNMle (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 Aug 2020 08:41:34 -0400
Received: from oasis.local.home (unknown [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7518A20866;
        Fri, 14 Aug 2020 12:41:33 +0000 (UTC)
Date:   Fri, 14 Aug 2020 08:41:23 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Sean Paul <sean@poorly.run>, lkft-triage@lists.linaro.org,
        Ingo Molnar <mingo@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: WARNING: at kernel/trace/trace.c:1727
 update_max_tr_single.part.0+0xa8/0x148
Message-ID: <20200814084123.5b64c0cf@oasis.local.home>
In-Reply-To: <CA+G9fYvVEhs_HROaXaW70mWrp_z6N4mJ-3rfFs0iAcT9Kg3A1A@mail.gmail.com>
References: <CA+G9fYvVEhs_HROaXaW70mWrp_z6N4mJ-3rfFs0iAcT9Kg3A1A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 14 Aug 2020 14:53:36 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> steps to reproduce:
> # Boot qemu arm64 with trace configs enabled ^.
> # cd /opt/ltp
> # ./runltp -f tracing

I don't run ltp, what  exactly is this doing?

-- Steve
