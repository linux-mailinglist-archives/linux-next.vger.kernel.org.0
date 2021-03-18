Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9453410F6
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 00:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhCRXXl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 19:23:41 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:36301 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhCRXXi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 19:23:38 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4F1jkq1nN6zybF;
        Fri, 19 Mar 2021 10:23:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1616109814;
        bh=7u8eB13Q6KxjhFmE2PIjOeXy5JLOIRaqQwS6IrQ/T4g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a0uJvjasvBHTdSbKopEny9/dge922bfeO3amPYx1G6PTZKDzpx+Yx5JhaA8cPdZmH
         eKZp1XDOwyxqrzn+H3c7vtdRWtRb/9/+Ox0DlEwlSlBqjZfMcKGf9Ox4K/efmL8ahh
         POh2ygNqB+4d3Sq/pJNBTS16S9FvBYInQsdbTuaqSZB5JO721kSracA/ACb+jZPA5+
         Y+deiRjrLRZI9dxZP3mJLd01/Gm4jQzV9U7Hu81f7Ciwy7jnNxIMYd2eILjnD8bxjl
         rR4kQnqRSbTiqA1S5Gpfa2wYou/Sphc7vwpgRIu4En/oJqhc4hSaSM3gJ2L9iCNP0L
         GvZyb2VbnkseQ==
Date:   Fri, 19 Mar 2021 10:23:30 +1100
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error fetching the arm-soc-fixes tree
Message-ID: <20210319102330.1febe300@elm.ozlabs.ibm.com>
In-Reply-To: <CAK8P3a31py=31dMgb+XKOwJo70v6Cab1yUJAB5zaF-0_ReP4sw@mail.gmail.com>
References: <20210308185741.56900784@canb.auug.org.au>
        <20210316084342.13b804f3@canb.auug.org.au>
        <CAK8P3a31py=31dMgb+XKOwJo70v6Cab1yUJAB5zaF-0_ReP4sw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Arnd,

On Thu, 18 Mar 2021 23:55:48 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> Sorry for the delay. I had cleaned out the old branches while updating to -rc2
> and forgot to upload the new fixes. I just pushed the branch with the latest
> fixes.

No problem, I assumed that if you had any urgent fixes, you would
recreate the branch.

-- 
Cheers,
Stephen Rothwell
