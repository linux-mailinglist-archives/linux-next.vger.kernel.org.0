Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6445E3D0F11
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 15:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbhGUMJV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 08:09:21 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33448 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234803AbhGUMJR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 08:09:17 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 2CFF11FEA1;
        Wed, 21 Jul 2021 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1626871793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WUPUAKftdFzyyiAMLMLIuDbkfRnDbbfd/EGptMpSkLo=;
        b=u3vggxYNGQN4filIH/yYqxoGMX01I9C+yawcoCGM96/le5wYwiT4gfz9PCkonkYnskkXA9
        jyfh80Inrg58ToQ1EFew1AqfGFSo/qJrU+rqLp1Y4J38ePamUrYAqW53ij+jjd8sZd/5GG
        t0I5JtGFLf3ZzNuj4ttBxPwULn5rE88=
Received: from suse.cz (pathway.suse.cz [10.100.12.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 8D7ACA3B89;
        Wed, 21 Jul 2021 12:49:52 +0000 (UTC)
Date:   Wed, 21 Jul 2021 14:49:52 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Chris Down <chris@chrisdown.name>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20210721124952.xyhxajifizwfdekr@pathway.suse.cz>
References: <20210720174300.018cc765@canb.auug.org.au>
 <CA+G9fYs2ApGkrJHL5HOO1jEJZ714itVp+Tdj7fWzkG+JWc=pOA@mail.gmail.com>
 <YPbBfdz9srIpI+bb@chrisdown.name>
 <20210721085705.fy6hrc5n3qtlwehq@pathway.suse.cz>
 <YPgDahcOZn6QNz1r@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPgDahcOZn6QNz1r@chrisdown.name>
User-Agent: NeoMutt/20170912 (1.9.0)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 2021-07-21 12:22:18, Chris Down wrote:
> Petr Mladek writes:
> > Chris, could you please send it as a proper patch?
> 
> Sure thing -- just to confirm, resend the whole series to you with these
> fixes squashed in, right? :-)

Good question. I would prefer to avoid the rebase. Please, send
it as a followup patch.

Best Regards,
Petr
