Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570F23491BF
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 13:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhCYMRq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 08:17:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230343AbhCYMR0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Mar 2021 08:17:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A165661A10;
        Thu, 25 Mar 2021 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616674642;
        bh=kkFyY9n0VOz+8ngV5G7XeEy2AAU13smXdeCJVNnyhtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1rBxlV9BZc9jyAT8+4JpDSnwtn7ZFBFhLg9lDNsrrrHAtO7waKcEQPZRbrLWb7IU/
         wqzYKqPy/rZDPnnuajnwo4uEnoWw2pT66bVupTCh1Pb5din2hDy/eMRQycRe5N+eDY
         4EmT13/oOCThGqkE9zVogYYppn1qnwonBDVlcN20=
Date:   Thu, 25 Mar 2021 13:17:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 24 (drivers/tty/serial/pch_uart.c)
Message-ID: <YFx/T86yuA8+OogL@kroah.com>
References: <20210324210718.0c2e6d62@canb.auug.org.au>
 <635dac0e-a82c-d3d0-c03b-e9d87585b39a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <635dac0e-a82c-d3d0-c03b-e9d87585b39a@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 24, 2021 at 08:54:15AM -0700, Randy Dunlap wrote:
> On 3/24/21 3:07 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210323:
> > 
> 
> 
> on x86_64:
> # CONFIG_DEBUG_FS is not set
> 
> 
> ../drivers/tty/serial/pch_uart.c: In function ‘pch_uart_init_port’:
> ../drivers/tty/serial/pch_uart.c:1815:9: error: ‘port_regs_ops’ undeclared (first use in this function); did you mean ‘kobj_ns_ops’?
>         &port_regs_ops);
> 

Should already be fixed now, thanks.

greg k-h
