Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC6743B21B
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 14:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbhJZMSB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 08:18:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:40312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230219AbhJZMSB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 08:18:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 828156103C;
        Tue, 26 Oct 2021 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635250537;
        bh=dgIdpO5tOpdN+h8++P0Y1JQpVQErs3vpF1tWU8zm8ZA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GqQYzQ7hhcMu9KfnEulh3bOux3e39kA0jjHHW6E5Ik35ILUsyA7PTGqqXjKbugUAS
         SCZ96wGu8s4tZQdP/1qBvpKD/iK0hzwKKgml357+trHZngZna5y8RE1lRksdJligN6
         XbBsJisyAfNAJ5jOWtPqSAzahqGE2owyt9huYFXcvAoJO4l9IXoYXLc4TLGUA92hWg
         ic22vMkFpRO2V3Vje942gerd1se9wwGXPf5eQNaV81rnUsoTFH8nIeroNOkOgQKt80
         zLL2N0b01TM6DtGAqj0ktAQ9Fd9sDcY78gGyrwUnGHRFtQVEFl8a/qHG7ohL0pGQzh
         MqDAyly8Ik8lA==
Date:   Tue, 26 Oct 2021 21:15:34 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-Id: <20211026211534.8048d6331581c31c6cdbf253@kernel.org>
In-Reply-To: <20211026103553.46c956db@canb.auug.org.au>
References: <20211026103553.46c956db@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 26 Oct 2021 10:35:53 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> lib/bootconfig.c:78: warning: Function parameter or member 'node_size' not described in 'xbc_get_info'
> lib/bootconfig.c:78: warning: Function parameter or member 'data_size' not described in 'xbc_get_info'
> 
> Introduced by commit
> 
>   e306220cb7b7 ("bootconfig: Add xbc_get_info() for the node information")

Oops, thanks for reporting! I just missed '@' for those parameters...

Thank you,

> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
Masami Hiramatsu <mhiramat@kernel.org>
