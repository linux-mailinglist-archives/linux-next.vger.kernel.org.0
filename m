Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B183C22F614
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 19:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgG0RGR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 13:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728626AbgG0RGR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 13:06:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4956CC061794;
        Mon, 27 Jul 2020 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=H2hMVO0DvvdnV/52WjxaCmZ/2+HoWo9ccpnlHRms9Sg=; b=DKFG2qDXCWMD3wvB7voq22f0v0
        I48AwoyLIo7PrzicNlGbBLQafgHUgzuT4XcUPZP2HxPCgA1p4O1LwMDudYI7BaTtgl9jYMAXVqZ+m
        0yT5/qPrQmXYEeITjlzVBKHG7f5rLDeUC/zEp8Lbxv5OBIQ6Iy/XqZIyyp80Y8auFfuIIZmZKiAW6
        7XKydT4mJooQ+XJ5PtQYcHnafNjy8p0YaKcvwcVj6GdPe1oaJukFPhvXKgjyvtsb+gJLLAFFIXG7R
        OtVyf3fTOJgPLbumotigYC4qu33TQnZ1ZcWH8feO1nqaHi0eqoTdHOftOP+CRUEl9siKqmucJCpXm
        DpqbTm4w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k06Zq-00060Q-AI; Mon, 27 Jul 2020 17:06:14 +0000
Subject: Re: linux-next: Tree for Jul 27 (drivers/usb/dwc2/drd.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        USB list <linux-usb@vger.kernel.org>
References: <20200727232346.0106c375@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <62a2eb1d-ccf0-f35d-e679-4aab2667c9d8@infradead.org>
Date:   Mon, 27 Jul 2020 10:06:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727232346.0106c375@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/27/20 6:23 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200724:
> 

on i386:

CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PERIPHERAL is not set
# CONFIG_USB_DWC2_DUAL_ROLE is not set
# CONFIG_USB_DWC2_PCI is not set
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
# CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
CONFIG_USB_DWC2_DEBUG_PERIODIC=y


../drivers/usb/dwc2/drd.c: In function ‘dwc2_drd_role_sw_set’:
../drivers/usb/dwc2/drd.c:80:38: error: ‘struct dwc2_hsotg’ has no member named ‘test_mode’; did you mean ‘dr_mode’?
  if (role == USB_ROLE_NONE && hsotg->test_mode) {
                                      ^~~~~~~~~
                                      dr_mode

../drivers/usb/dwc2/drd.c:114:5: error: implicit declaration of function ‘dwc2_hsotg_core_disconnect’; did you mean ‘dwc2_hsotg_core_connect’? [-Werror=implicit-function-declaration]
     dwc2_hsotg_core_disconnect(hsotg);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
     dwc2_hsotg_core_connect



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
