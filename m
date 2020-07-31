Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2855523423B
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 11:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732037AbgGaJSl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 05:18:41 -0400
Received: from verein.lst.de ([213.95.11.211]:58677 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732014AbgGaJSk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 31 Jul 2020 05:18:40 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A78B768BFE; Fri, 31 Jul 2020 11:18:38 +0200 (CEST)
Date:   Fri, 31 Jul 2020 11:18:38 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: Tree for Jul 30 [build failure on arm64]
Message-ID: <20200731091838.GA14327@lst.de>
References: <20200730214659.0fbfdfc4@canb.auug.org.au> <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com> <20200731140842.46abe589@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200731140842.46abe589@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Ok, looks like my baseline had arm64 defconfig fail due to a missing
include already, so the script didn't see a regression due to the
existing failure in ptrauth_keys_init_user.

Looks like moving the definіtion to asm-generic/compat.h is a better
idea better anyway.
