Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5E243DBA1
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 09:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhJ1HGC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 03:06:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhJ1HGC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Oct 2021 03:06:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6707160FF2;
        Thu, 28 Oct 2021 07:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635404615;
        bh=86u9JaFjx1bbI+cakk6gCSU7N3ac0DZfd5iIvtQn9T4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CaHOKMYkUuGT9nrJwKqIOyJK+o/+MlD1QlKOqjx4IgSCKgIlYo7+fy2AdcK7UaRMt
         xpq2MObON9CuAhoCr3hZyjXvKzCjEMrnwFssTRE8EwePYQK2Ug8k6n3GvUiT/VNagr
         yEH0tvWZIkAX510CYiPkgjADkFLvGESNuCA1LjWqFaB6qJ+p5RGKU3opyKOUFwqCfJ
         jLvAxcT1fUQnEaHXUDnQkhYI1A07i9R6XZ+smh4jG6bLsMPOWCm6Qk4svHE1xrhQPA
         ThP28IX+rKv8Ze4twvy7VdDldDkY4HgEcKduTykp6yq0zXnLPRxOogeXiHqx0HTmLe
         OeWb2Me65fTAQ==
Date:   Thu, 28 Oct 2021 08:03:31 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Joey Gouly <joey.gouly@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
Message-ID: <20211028080331.6d199082@sal.lan>
In-Reply-To: <874k92bu4q.wl-maz@kernel.org>
References: <20211027220118.71a229ab@canb.auug.org.au>
        <874k92bu4q.wl-maz@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Wed, 27 Oct 2021 12:10:45 +0100
Marc Zyngier <maz@kernel.org> escreveu:

> On Wed, 27 Oct 2021 12:01:18 +0100,
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Hi all,
> > 
> > After merging the pinctrl tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > include/linux/gpio/driver.h:284: warning: Function parameter or member 'parent_handler_data_array' not described in 'gpio_irq_chip'
> > 
> > Introduced by commit
> > 
> >   cfe6807d82e9 ("gpio: Allow per-parent interrupt data")
> > 
> > But may actually be a problem with the tool :-(  
> 
> I guess the tool doesn't like having two fields that are part of a
> union documented together... Happy to tweak it if someone tells me how
> this should be written.

Yes, that's the case. See, when you do:

	/**
	 * @parent_handler_data:
	 * @parent_handler_data_array:
	 *
	 * Data associated, and passed to, the handler for the parent
	 * interrupt. Can either be a single pointer if @per_parent_data
	 * is false, or an array of @num_parents pointers otherwise.  If
	 * @per_parent_data is true, @parent_handler_data_array cannot be
	 * NULL.
	 */
	union {
		void *parent_handler_data;
		void **parent_handler_data_array;
	};

The tool will understand it as an undocumented "parent_handler_data" and
a documented "parent_handler_data_array".

It has to do that, as otherwise it won't get cases where people just adds a
@foo: as a template but actually forgets to fill it.

The solution would be to add a description for both, e. g. something
similar to:

	/**
	 * @parent_handler_data:
	 *
	 * If @per_parent_data is false, contains a single pointer 
	 * with the data associated, and passed to, the handler for the 
	 * parent interrupt.
	 *
	 * @parent_handler_data_array:
	 *
	 * If @per_parent_data is true, it should contain an array of 
	 * @num_parents pointers with the data associated, and passed to,
	 * the handler for the parent interrupt. Cannot be NULL.
	 */

Regards,
Mauro
