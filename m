Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15722B81E9
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 17:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgKRQ23 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 11:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbgKRQ23 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 11:28:29 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0213DC0613D4;
        Wed, 18 Nov 2020 08:28:29 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A2B2635A;
        Wed, 18 Nov 2020 16:28:28 +0000 (UTC)
Date:   Wed, 18 Nov 2020 09:28:27 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ftrace/documentation: Fix RST C code blocks
Message-ID: <20201118092827.583e3db9@lwn.net>
In-Reply-To: <20201118112651.0b1c9944@gandalf.local.home>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
        <20201118103502.24e90f7c@gandalf.local.home>
        <20201118105127.4a7b02ef@gandalf.local.home>
        <20201118092432.1407b900@lwn.net>
        <20201118112651.0b1c9944@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 18 Nov 2020 11:26:51 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> OK, I'll take it, but can you give an ack?

Acked-by: Jonathan Corbet <corbet@lwn.net>

jon
